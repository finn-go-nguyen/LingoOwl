import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/lecture/view/lecture_screen/lecture_screen_controller.dart';
import '../dialog/alert_dialog.dart';
import 'app_bar.dart';

class NonVideoViewport extends ConsumerWidget {
  const NonVideoViewport({
    super.key,
    required this.child,
    required this.title,
    this.isQuiz = false,
  });

  final String title;
  final Widget child;
  final bool isQuiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseId = ref.read(lectureScreenCurrentCourseIdProvider);

    return WillPopScope(
      onWillPop: () async {
        if (isQuiz) {
          showAlertDialog(
            context: context,
            title: 'Skip quiz?',
            defaultActionText: 'Skip',
            cancelActionText: 'Cancel',
            onConfirmPressed: ref
                .read(lectureScreenControllerProvider(courseId).notifier)
                .onLectureComplete,
          );
          return false;
        }
        ref
            .read(lectureScreenControllerProvider(courseId).notifier)
            .onLectureComplete();
        return false;
      },
      child: Scaffold(
        appBar: LAppBar(
          title: Text(title),
          leading: BackButton(
            onPressed: () {
              if (isQuiz) {
                showAlertDialog(
                  context: context,
                  title: 'Skip quiz?',
                  defaultActionText: 'Skip',
                  cancelActionText: 'Cancel',
                  onConfirmPressed: ref
                      .read(lectureScreenControllerProvider(courseId).notifier)
                      .onLectureComplete,
                );
                return;
              }
              ref
                  .read(lectureScreenControllerProvider(courseId).notifier)
                  .onLectureComplete();
            },
          ),
        ),
        body: child,
      ),
    );
  }
}
