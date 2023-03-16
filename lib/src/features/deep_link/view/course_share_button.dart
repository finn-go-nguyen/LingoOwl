import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/async_value_ui.dart';
import 'course_share_button_controller.dart';

class CourseShareButton extends ConsumerWidget {
  const CourseShareButton({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      courseShareButtonProvider,
      (previous, next) {
        next.showError(context);
        next.showLoadingDialog(context, previous);
      },
    );
    return IconButton(
      onPressed: () => ref
          .read(courseShareButtonProvider.notifier)
          .onShareButtonPressed(courseId),
      icon: const Icon(Icons.share),
    );
  }
}
