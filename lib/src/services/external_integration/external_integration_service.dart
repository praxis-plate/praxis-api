import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/external_integration/adapters/external_integration_adapter.dart';
import 'package:praxis_server/src/services/external_integration/adapters/external_lms_adapter.dart';
import 'package:praxis_server/src/services/external_integration/adapters/external_video_conferencing_adapter.dart';
import 'package:praxis_server/src/services/external_integration/entities/external_integration_auth_context.dart';
import 'package:serverpod/serverpod.dart';

class ExternalIntegrationService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final Map<ExternalIntegrationProvider, ExternalIntegrationAdapter> _adapters;

  ExternalIntegrationService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _adapters = _buildAdapters();

  List<ExternalIntegrationProviderDto> listProviders() {
    return _adapters.values.map((adapter) => adapter.toProviderDto()).toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  Future<ExternalCourseSyncDto> syncCourse(
    Session session,
    SyncCourseToExternalProviderRequest request,
  ) async {
    final adapter = _requireAdapter<ExternalLmsAdapter>(
      request.provider,
      ExternalIntegrationKind.lms,
    );
    final authContext = ExternalIntegrationAuthContext(
      provider: request.provider,
      baseUrl: request.baseUrl,
      accessToken: request.accessToken,
      accountIdentifier: _normalizeOptionalText(request.accountIdentifier),
    );
    adapter.validateAuthContext(authContext);

    final course = await _courseDataSource.findById(session, request.courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, course.id!);
    final lessons = await _lessonDataSource.listByModuleIds(
      session,
      modules.map((module) => module.id!).toList(),
    );
    final tasks = await _taskDataSource.listByLessonIds(
      session,
      lessons.map((lesson) => lesson.id!).toList(),
    );

    return ExternalCourseSyncDto(
      provider: request.provider,
      kind: ExternalIntegrationKind.lms,
      courseId: course.id!,
      externalCourseId: adapter.buildCourseId(course),
      externalCourseUrl: adapter.buildCourseUrl(
        baseUrl: request.baseUrl.trim(),
        course: course,
      ),
      accountIdentifier: authContext.accountIdentifier,
      contentStatus: course.contentStatus,
      exportedModules: modules.length,
      exportedLessons: lessons.length,
      exportedTasks: tasks.length,
      syncedAt: DateTime.now(),
      summary:
          'Exported ${modules.length} modules, ${lessons.length} lessons, and ${tasks.length} tasks to ${adapter.displayName}',
    );
  }

  Future<ExternalVideoSessionDto> provisionLessonVideoSession(
    Session session,
    ProvisionExternalVideoSessionRequest request,
  ) async {
    final adapter = _requireAdapter<ExternalVideoConferencingAdapter>(
      request.provider,
      ExternalIntegrationKind.videoConferencing,
    );
    final authContext = ExternalIntegrationAuthContext(
      provider: request.provider,
      baseUrl: request.baseUrl,
      accessToken: request.accessToken,
      accountIdentifier: _normalizeOptionalText(request.accountIdentifier),
    );
    adapter.validateAuthContext(authContext);

    final lesson = await _lessonDataSource.findById(session, request.lessonId);
    if (lesson == null) {
      throw NotFoundException(message: 'Lesson not found');
    }

    final sessionTitle =
        _normalizeOptionalText(request.sessionTitle) ?? lesson.title;
    final baseUrl = adapter.resolveBaseUrl(request.baseUrl);
    final updatedAt = DateTime.now();
    final meetingCode = adapter.buildMeetingCode(
      lessonId: lesson.id!,
      sessionTitle: sessionTitle,
    );
    final joinUrl = adapter.buildJoinUrl(
      baseUrl: baseUrl,
      meetingCode: meetingCode,
    );
    final hostUrl = adapter.buildHostUrl(
      baseUrl: baseUrl,
      meetingCode: meetingCode,
    );

    await _lessonDataSource.updateRow(
      session,
      lesson.copyWith(
        videoUrl: joinUrl,
        updatedAt: updatedAt,
      ),
    );
    await _touchLessonAncestors(
      session,
      lesson.moduleId,
      updatedAt,
    );

    return ExternalVideoSessionDto(
      provider: request.provider,
      kind: ExternalIntegrationKind.videoConferencing,
      lessonId: lesson.id!,
      sessionTitle: sessionTitle,
      lessonVideoUrl: joinUrl,
      hostUrl: hostUrl,
      meetingCode: meetingCode,
      accountIdentifier: authContext.accountIdentifier,
      provisionedAt: updatedAt,
    );
  }

  T _requireAdapter<T extends ExternalIntegrationAdapter>(
    ExternalIntegrationProvider provider,
    ExternalIntegrationKind expectedKind,
  ) {
    final adapter = _adapters[provider];
    if (adapter == null) {
      throw ValidationException(
        message: 'Unsupported external integration provider',
        field: 'provider',
      );
    }
    if (adapter.kind != expectedKind) {
      throw ValidationException(
        message:
            'Provider ${provider.name} does not support ${expectedKind.name} operations',
        field: 'provider',
      );
    }
    return adapter as T;
  }

  String? _normalizeOptionalText(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return normalized;
  }

  Future<void> _touchLessonAncestors(
    Session session,
    int moduleId,
    DateTime updatedAt,
  ) async {
    final module = await _moduleDataSource.findById(session, moduleId);
    if (module == null) {
      throw NotFoundException(message: 'Module not found');
    }

    await _moduleDataSource.updateRow(
      session,
      module.copyWith(updatedAt: updatedAt),
    );

    final course = await _courseDataSource.findById(session, module.courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    await _courseDataSource.updateRow(
      session,
      course.copyWith(updatedAt: updatedAt),
    );
  }

  static Map<ExternalIntegrationProvider, ExternalIntegrationAdapter>
  _buildAdapters() {
    return {
      ExternalIntegrationProvider.moodle: const ExternalLmsAdapter(
        provider: ExternalIntegrationProvider.moodle,
        displayName: 'Moodle',
        authScheme: ExternalIntegrationAuthScheme.apiToken,
      ),
      ExternalIntegrationProvider.canvas: const ExternalLmsAdapter(
        provider: ExternalIntegrationProvider.canvas,
        displayName: 'Canvas',
        authScheme: ExternalIntegrationAuthScheme.apiToken,
      ),
      ExternalIntegrationProvider.zoom: const ExternalVideoConferencingAdapter(
        provider: ExternalIntegrationProvider.zoom,
        displayName: 'Zoom',
        defaultBaseUrl: 'https://zoom.example.com',
        authScheme: ExternalIntegrationAuthScheme.oauth2,
      ),
      ExternalIntegrationProvider.googleMeet:
          const ExternalVideoConferencingAdapter(
            provider: ExternalIntegrationProvider.googleMeet,
            displayName: 'Google Meet',
            defaultBaseUrl: 'https://meet.google.com',
            authScheme: ExternalIntegrationAuthScheme.oauth2,
          ),
    };
  }
}
