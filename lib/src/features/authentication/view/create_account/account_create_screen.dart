import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../../../themes/styles.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/scaffold.dart';
import '../../../../widgets/common/term_privacy.dart';
import 'account_create_form.dart';
import 'account_create_screen_controller.dart';

class AccountCreateScreen extends ConsumerWidget {
  const AccountCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountCreateScreenControllerProvider.select((state) => state.status),
      (_, state) {
        state.showError(context);
      },
    );
    return LScaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: UiParameters.screenPadding,
          child: Column(
            children: [
              Gaps.h64,
              Text(
                'Create an account',
                style: LStyles.ebGaramond(context),
              ),
              Gaps.h20,
              const TermPrivacy(),
              Gaps.h32,
              const AccountCreateForm(),
              Gaps.h20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account?'),
                  TextButton(
                    onPressed: () => LCoordinator.onBack(),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
