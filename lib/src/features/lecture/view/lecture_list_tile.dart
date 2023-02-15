import 'package:flutter/material.dart';

import '../../../widgets/dialog/alert_dialog.dart';

class LectureListTile extends StatelessWidget {
  const LectureListTile({
    super.key,
    this.isSelected = false,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showNotImplementedAlertDialog(context: context),
      horizontalTitleGap: 0.0,
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      leading: SizedBox.square(
        dimension: 50.0,
        child: Center(
          child: Text(
            '1',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      trailing: IconButton(
        onPressed: () => showNotImplementedAlertDialog(context: context),
        icon: const Icon(Icons.download_for_offline_outlined),
      ),
      title: Text(
        'Introduction',
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
