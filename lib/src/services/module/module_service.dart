import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class ModuleService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;

  ModuleService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource;

  Future<List<ModuleDto>> getByCourseId(Session session, int courseId) async {
    final course = await _courseDataSource.findPublishedById(session, courseId);
    if (course == null) {
      return [];
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    return modules.map((module) => module.toModuleDto()).toList();
  }
}
