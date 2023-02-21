import 'package:flutter/material.dart';

import '../../../constants/app_constants/lecture_more_items.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../router/coordinator.dart';

class LectureMoreView extends StatefulWidget {
  const LectureMoreView({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  State<LectureMoreView> createState() => _LectureMoreViewState();
}

class _LectureMoreViewState extends State<LectureMoreView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          LectureMoreItem.items.length,
          (index) {
            final item = LectureMoreItem.items[index];
            return ListTile(
              onTap: () => LCoordinator.showNoteScreen(widget.courseId),
              leading: Icon(item.iconData),
              title: Text(item.label),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
