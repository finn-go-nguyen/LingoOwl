import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/dialog/alert_dialog.dart';
import '../../model/lecture/lecture.dart';

class LectureListTile extends ConsumerWidget {
  const LectureListTile({
    super.key,
    required this.lecture,
    this.isSelected = false,
    required this.onTap,
  });

  final LLecture lecture;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      leading: SizedBox.square(
        dimension: 50.0,
        child: Center(
          child: Text(
            lecture.index.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      trailing: IconButton(
        onPressed: () => showNotImplementedAlertDialog(context: context),
        icon: const Icon(Icons.download_for_offline_outlined),
      ),
      title: Text(
        lecture.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: isSelected ? FontWeight.bold : null),
      ),
      subtitle: Row(
        children: const [
          Icon(Icons.closed_caption),
          Text('Video - 03:50 mins')
        ],
      ),
    );
  }
}
