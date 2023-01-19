import 'package:flutter/material.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/state/loading.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../widgets/common/network_image.dart';
import '../../model/app_user.dart';

class ProfileAvatarNameHeadline extends StatelessWidget {
  const ProfileAvatarNameHeadline({
    super.key,
    this.user,
    this.isLoading = false,
  }) : assert((user == null && isLoading) || (user != null && !isLoading));

  final LAppUser? user;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingState()
        : Column(
            children: [
              LNetworkImage(
                user!.photoUrl ?? '',
                fit: BoxFit.cover,
                dimension: Sizes.avatar,
                radius: Sizes.circleBorderRadius,
              ),
              Gaps.h12,
              Text(
                TextHelpers.toDisplayName(
                  firstName: user!.firstName,
                  lastName: user!.lastName,
                ),
                style: Theme.of(context).textTheme.headline6,
              ),
              Gaps.h12,
              user!.headline == null
                  ? const SizedBox.shrink()
                  : Text(
                      user!.headline!,
                      style: Theme.of(context).textTheme.caption,
                    ),
            ],
          );
  }
}
