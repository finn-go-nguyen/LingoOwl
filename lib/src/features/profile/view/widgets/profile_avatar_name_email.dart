import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/common/network_image.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../model/app_user.dart';

class ProfileAvatarNameEmail extends StatelessWidget {
  const ProfileAvatarNameEmail({
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
                radius: UiParameters.circleBorderRadius,
                dimension: UiParameters.avatar,
              ),
              Gaps.h20,
              Text(
                TextHelpers.toDisplayName(
                  firstName: user!.firstName,
                  lastName: user!.lastName,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Gaps.h12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: UiParameters.iconSize * .8,
                    child: Assets.icons.google.image(),
                  ),
                  Gaps.w8,
                  Text(
                    user!.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          );
  }
}