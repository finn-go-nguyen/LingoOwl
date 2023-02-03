import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/app_parameters/ui_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/common/network_image.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../authentication/data/authentication_repository.dart';
import '../../data/user_repository.dart';

class ProfileAvatarNameHeadline extends ConsumerWidget {
  const ProfileAvatarNameHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(uidProvider);

    if (uid == null) return const SizedBox.shrink();

    final userAsync = ref.watch(userStreamProvider(uid));
    return userAsync.when(
      data: (user) => Column(
        children: [
          LNetworkImage(
            user.photoUrl ?? '',
            fit: BoxFit.cover,
            dimension: UiParameters.avatar,
            borderRadius: UiParameters.circleBorderRadius,
          ),
          Gaps.h12,
          Text(
            TextHelpers.toDisplayName(
              firstName: user.firstName,
              lastName: user.lastName,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Gaps.h12,
          user.headline == null
              ? const SizedBox.shrink()
              : Text(
                  user.headline!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
        ],
      ),
      error: (_, __) => const ErrorState(),
      loading: () => const LoadingState(),
    );
  }
}
