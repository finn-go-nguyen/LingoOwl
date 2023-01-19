import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import 'public_profile_edit_form.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                Padding(
                  padding: Sizes.rowContentPadding,
                  child: Column(
                    children: [
                      Text(
                        'Public profile',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Text('Add information about yourself'),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: Sizes.rowContentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      PublicProfileEditForm(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Gaps.h32,
      ],
    );
  }
}
