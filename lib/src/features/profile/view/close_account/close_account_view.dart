import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/app_router.dart';
import '../../../../router/coordinator.dart';
import '../../../../themes/themes.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
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
            TableRow(
              children: [
                Padding(
                  padding: UiParameters.rowContentPadding,
                  child: Column(
                    children: [
                      Text(
                        'Close Account',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Text('Close your account permanently.'),
                    ],
                  ),
                )
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
                                  .subtitle1
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
                            onPressed: () async {
                              showAlertDialog(
                                context: context,
                                title: 'Close your account?',
                                content:
                                    'Are you sure you want to close your account?',
                                cancelActionText: 'Cancel',
                              ).then(
                                (isConfirmed) {
                                  if (isConfirmed ?? false) {
                                    LCoordinator.goNamed(
                                        LRoute.closeAccountConfirmation.name);
                                  }
                                },
                              );
                            },
                            child: Text(
                              'Close account',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
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
