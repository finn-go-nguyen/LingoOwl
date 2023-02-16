import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/common/network_image.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../authentication/data/authentication_repository.dart';
import '../../data/user_repository.dart';

class ProfileAvatarNameEmail extends ConsumerWidget {
  const ProfileAvatarNameEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(uidProvider);

    if (uid == null) return const SizedBox.shrink();

    final userAsync = ref.watch(userStreamProvider(uid));
    final textHelpers = ref.watch(textHelpersProvider);
    return userAsync.when(
      data: (user) => Column(
        children: [
          LNetworkImage(
            user.photoUrl ?? '',
            fit: BoxFit.cover,
            borderRadius: UiParameters.circleBorderRadius,
            dimension: UiParameters.avatar,
          ),
          Gaps.h20,
          Text(
            textHelpers.toDisplayName(
              firstName: user.firstName,
              lastName: user.lastName,
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
                user.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
      error: (_, __) => const ErrorState(),
      loading: () => const LoadingState(),
    );
  }
}
