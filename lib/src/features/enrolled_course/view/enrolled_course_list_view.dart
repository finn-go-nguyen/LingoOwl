import 'package:flutter/material.dart';

import '../model/enrolled_course.dart';
import 'enrolled_course_card.dart';

class EnrolledCourseListView extends StatelessWidget {
  const EnrolledCourseListView({
    super.key,
    required this.courses,
  });

  final List<EnrolledCourse> courses;

  @override
  Widget build(BuildContext context) {
    final sortedCourses = List<EnrolledCourse>.from(courses)
      ..sort(
        (a, b) => b.timeStamp.compareTo(a.timeStamp),
      );
    return ListView.builder(
      itemCount: sortedCourses.length,
      itemBuilder: (context, index) {
        final enrolledCourse = sortedCourses[index];
        return EnrolledCourseCard(courseId: enrolledCourse.courseId);
      },
    );
  }
}
