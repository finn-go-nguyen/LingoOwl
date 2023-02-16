import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../model/lecture/lecture.dart';
import '../../model/section/section.dart';
import '../lecture_screen_controller.dart';
import 'lecture_list_tile.dart';

class LectureSection extends ConsumerWidget {
  const LectureSection({
    super.key,
    required this.section,
    required this.sectionLectures,
    required this.selectedIndex,
    required this.courseId,
  });

  final LSection section;
  final List<LLecture> sectionLectures;
  final Index selectedIndex;
  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Gaps.w16,
            Text(
              'Section ${section.index} - ${section.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            IconButton(
              onPressed: () => showNotImplementedAlertDialog(context: context),
              icon: const Icon(Icons.download_for_offline_outlined),
            )
          ],
        ),
        ...List.generate(
          sectionLectures.length,
          (index) {
            final lecture = sectionLectures[index];
            return LectureListTile(
              onTap: () => ref
                  .read(lectureScreenControllerProvider(courseId).notifier)
                  .onLectureTileTapped(lecture),
              lecture: lecture,
              isSelected: lecture.index == selectedIndex,
            );
          },
        ).toList()
      ],
    );
  }
}
