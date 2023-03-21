import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/enums/lecture_type.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../model/lecture/lecture.dart';
import '../lecture_screen/lecture_screen_controller.dart';

class LectureListTile extends ConsumerWidget {
  const LectureListTile({
    super.key,
    required this.lecture,
    this.isSelected = false,
    required this.onTap,
  });

  final LLecture lecture;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeading(),
      trailing: lecture.type.isVideo
          ? IconButton(
              onPressed: () => showNotImplementedAlertDialog(context: context),
              icon: const Icon(Icons.download_for_offline_outlined),
            )
          : null,
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
    );
  }

  Widget _buildLeading() {
    late IconData iconData;
    switch (lecture.type) {
      case LectureType.video:
        iconData = Icons.ondemand_video_outlined;
        break;
      case LectureType.article:
        iconData = Icons.article;
        break;
      case LectureType.quiz:
        iconData = Icons.quiz;
        break;
      default:
        iconData = Icons.category;
    }
    return SizedBox.square(
      dimension: 50.0,
      child: Icon(
        iconData,
      ),
    );
  }

  Widget _buildTitle() {
    return Consumer(builder: (context, ref, child) {
      final isWatched = ref.watch(watchCheckProvider(lecture.index));
      return Row(
        children: [
          if (isWatched)
            Padding(
              padding: const EdgeInsets.only(right: Sizes.p4),
              child: Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primaryContainer,
                size: 20,
              ),
            ),
          Expanded(
            child: Text(
              lecture.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: isSelected ? FontWeight.bold : null),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildSubtitle() {
    switch (lecture.type) {
      case LectureType.video:
        return Row(
          children: [
            const Icon(Icons.closed_caption),
            Consumer(
              builder: (context, ref, child) {
                final textHelper = ref.watch(textHelpersProvider);
                return Text(
                    'Video - ${textHelper.toTimeLabel(lecture.seconds)} mins');
              },
            ),
          ],
        );
      default:
        return Text(lecture.type.name.capitalize);
    }
  }
}
