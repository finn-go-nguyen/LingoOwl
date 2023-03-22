import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../deep_link/view/course_share_button_controller.dart';

class LectureMoreView extends ConsumerStatefulWidget {
  const LectureMoreView({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  ConsumerState<LectureMoreView> createState() => _LectureMoreViewState();
}

class _LectureMoreViewState extends ConsumerState<LectureMoreView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            onTap: () => LCoordinator.showNoteScreen(widget.courseId),
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('Notes'),
          ),
          ListTile(
            onTap: () => ref
                .read(courseShareButtonProvider.notifier)
                .onShareButtonPressed(widget.courseId),
            leading: const Icon(Icons.share),
            title: const Text('Share this Course'),
          ),
          ListTile(
            onTap: () => LCoordinator.showLeaveReviewScreen(widget.courseId),
            leading: const Icon(Icons.star_outline),
            title: const Text('Leave a review'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
