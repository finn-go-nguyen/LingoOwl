import 'package:flutter/material.dart';

import '../../../../../constants/type_defs/type_defs.dart';
import '../../../../../router/coordinator.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => LCoordinator.showLeaveReviewScreen(courseId),
      child: const Text('Leave a review'),
    );
  }
}
