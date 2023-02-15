import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../lecture_list_tile.dart';

class LectureSection extends StatelessWidget {
  const LectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Gaps.w16,
            Text(
              'Section 1 - Introduction',
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
          5,
          (index) => const LectureListTile(),
        ).toList()
      ],
    );
  }
}
