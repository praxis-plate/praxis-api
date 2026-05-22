class LoadTestSeedConfig {
  static const int defaultCourseCount = 40;
  static const String defaultCourseTitlePrefix = '[LoadTest] Course';
  static const String defaultLearnerEmail = 'loadtest.learner@praxis.local';
  static const String defaultLearnerPassword = 'LoadTest123!';

  final int courseCount;
  final String courseTitlePrefix;
  final String learnerEmail;
  final String learnerPassword;

  const LoadTestSeedConfig({
    this.courseCount = defaultCourseCount,
    this.courseTitlePrefix = defaultCourseTitlePrefix,
    this.learnerEmail = defaultLearnerEmail,
    this.learnerPassword = defaultLearnerPassword,
  });
}

class LoadTestSeedSummary {
  final String courseTitlePrefix;
  final int requestedCourseCount;
  final int createdCourseCount;
  final int totalCourseCount;
  final int totalModuleCount;
  final int totalLessonCount;
  final int totalTaskCount;
  final List<int> sampleCourseIds;
  final List<int> sampleLessonIds;
  final List<int> sampleTaskIds;
  final String learnerEmail;
  final String learnerPassword;

  const LoadTestSeedSummary({
    required this.courseTitlePrefix,
    required this.requestedCourseCount,
    required this.createdCourseCount,
    required this.totalCourseCount,
    required this.totalModuleCount,
    required this.totalLessonCount,
    required this.totalTaskCount,
    required this.sampleCourseIds,
    required this.sampleLessonIds,
    required this.sampleTaskIds,
    required this.learnerEmail,
    required this.learnerPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'courseTitlePrefix': courseTitlePrefix,
      'requestedCourseCount': requestedCourseCount,
      'createdCourseCount': createdCourseCount,
      'totalCourseCount': totalCourseCount,
      'totalModuleCount': totalModuleCount,
      'totalLessonCount': totalLessonCount,
      'totalTaskCount': totalTaskCount,
      'sampleCourseIds': sampleCourseIds,
      'sampleLessonIds': sampleLessonIds,
      'sampleTaskIds': sampleTaskIds,
      'learnerEmail': learnerEmail,
      'learnerPassword': learnerPassword,
    };
  }
}
