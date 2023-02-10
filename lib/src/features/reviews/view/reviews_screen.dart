import 'package:flutter/material.dart';

import '../../../constants/app_parameters/ui_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../widgets/common/common.dart';
import 'review_list.dart';
import 'review_star_count_section.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  final CourseId courseId;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: LAppBar(title: courseName),
      body: SingleChildScrollView(
        padding: UiParameters.screenPadding,
        child: Column(
          children: [
            ReviewStarCountSection(
              courseId: courseId,
            ),
            const ReviewList(),
          ],
        ),
      ),
    );
  }
}
