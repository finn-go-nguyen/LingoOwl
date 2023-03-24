import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../router/app_router.dart';
import '../../../widgets/common/common.dart';
import 'widgets/profile_avatar_name_headline.dart';
import 'widgets/profile_tab_selector.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({
    super.key,
    required this.current,
    required this.child,
  });

  final LRoutes current;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: const LAppBar(title: Text('Account Security')),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: UiParameters.screenPadding,
          child: Column(
            children: [
              Gaps.h24,
              const ProfileAvatarNameHeadline(),
              Gaps.h12,
              ProfileTabSelector(current: current),
              Gaps.h16,
              child,
            ],
          ),
        ),
      ),
    );
  }
}
