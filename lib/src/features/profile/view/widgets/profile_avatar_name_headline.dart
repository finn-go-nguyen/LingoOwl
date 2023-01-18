import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/app_parameters/ui_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/common/network_image.dart';
import '../../../../widgets/state/loading.dart';
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
                dimension: UiParameters.avatar,
                radius: UiParameters.circleBorderRadius,
              ),
              Gaps.h12,
              Text(
                TextHelpers.toDisplayName(
                  firstName: user!.firstName,
                  lastName: user!.lastName,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
