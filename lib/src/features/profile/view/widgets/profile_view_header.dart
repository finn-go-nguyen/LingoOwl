import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_parameters.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.rowContentPadding,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Gaps.h8,
          Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
