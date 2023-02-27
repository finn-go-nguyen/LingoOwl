import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../../../themes/themes.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../widgets/profile_view_header.dart';
import 'close_account_controller.dart';

class CloseAccountView extends ConsumerWidget {
  const CloseAccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(closeAccountControllerProvider,
        (previous, next) {
      next.showErrorLoadingSuccessState(
        context,
        previousState: previous,
        successMessage:
            'Your account has been closed! We at LingoOwl are sorry to see you go!',
      );
    });
    return Column(
      children: [
        Table(
          border: UiParameters.tableBorder,
          children: [
            const TableRow(
              children: [
                ProfileViewHeader(
                  title: 'Close Account',
                  subTitle: 'Close your account permanently.',
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Warning: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                            const TextSpan(
                              text:
                                  'If you close your account, you will be unsubscribed from all your courses, and will lose access forever.',
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            elevatedButtonTheme: LTheme.alertButtonTheme(),
                          ),
                          child: ElevatedButton(
                            onPressed: () => showAlertDialog(
                              context: context,
                              title: 'Close your account?',
                              content:
                                  'Are you sure you want to close your account?',
                              cancelActionText: 'Cancel',
                              onConfirmPressed: LCoordinator
                                  .showCloseAccountConfirmationScreen,
                            ),
                            child: Text(
                              'Close account',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        Gaps.h32,
      ],
    );
  }
}
