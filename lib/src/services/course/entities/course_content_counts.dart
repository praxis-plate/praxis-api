import 'package:equatable/equatable.dart';

class CourseContentCounts extends Equatable {
  final int totalLessons;
  final int totalTasks;

  const CourseContentCounts({
    required this.totalLessons,
    required this.totalTasks,
  });

  const CourseContentCounts.empty() : totalLessons = 0, totalTasks = 0;

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [totalLessons, totalTasks];
}
