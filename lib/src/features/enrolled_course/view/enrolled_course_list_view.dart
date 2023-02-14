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
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final enrolledCourse = courses[index];
        return EnrolledCourseCard(courseId: enrolledCourse.courseId);
      },
    );
  }
}
