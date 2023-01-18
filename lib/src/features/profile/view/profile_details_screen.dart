import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../router/app_router.dart';
import '../../../widgets/common/scaffold.dart';
import '../../../widgets/state/error.dart';
import '../../authentication/data/authentication_repository.dart';
import '../data/user_repository.dart';
import 'widgets/profile_avatar_name_headline.dart';
import 'widgets/profile_tab_selector.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({
    super.key,
    required this.current,
    required this.child,
  });

  final LRoute current;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: UiParameters.screenPadding,
          child: Column(
            children: [
              Consumer(builder: (context, ref, child) {
                final uid = ref.watch(uidProvider);
                final user = ref.watch(userStreamProvider(uid!));
                return user.when(
                  data: (user) => ProfileAvatarNameHeadline(user: user),
                  loading: () =>
                      const ProfileAvatarNameHeadline(isLoading: true),
                  error: (_, __) => const ErrorState(),
                );
              }),
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
