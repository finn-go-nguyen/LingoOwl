import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading.dart';
import '../../../authentication/data/authentication_repository.dart';
import '../../data/user_repository.dart';
import 'profile_controller.dart';
import 'public_profile_edit_form.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: UiParameters.tableBorder,
          children: [
            TableRow(
              children: [
                Padding(
                  padding: UiParameters.rowContentPadding,
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
                  padding: UiParameters.rowContentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          ref.listen(profileControllerProvider, (_, next) {
                            next.showSuccess(
                              context,
                              content: 'Your profile update successfully!',
                            );
                          });

                          final uid = ref.watch(uidProvider);
                          // * uid cannot be null because this view only visible
                          // * for logged in user
                          final user = ref.watch(userStreamProvider(uid!));
                          return user.when(
                            data: (user) => PublicProfileEditForm(user: user),
                            error: (_, __) => const ErrorState(),
                            loading: () => const LoadingState(),
                          );
                        },
                      ),
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
