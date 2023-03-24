import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../../../themes/styles.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/scaffold.dart';
import '../../../../widgets/common/term_privacy.dart';
import 'social_sign_in_controller.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(socialSignInControllerProvider,
        (previous, next) {
      next.showError(context);
      next.showLoadingDialog(context, previous);
    });
    return LScaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Gaps.h64,
            Text(
              'Sign In',
              style: LStyles.ebGaramond(context),
            ),
            Gaps.h20,
            const TermPrivacy(),
            const Spacer(),
            Padding(
              padding: UiParameters.screenPadding,
              child: Column(
                children: [
                  _SignInButton(
                    onPressed: () => LCoordinator.showEmailSignInScreen(),
                    image: Assets.icons.envelope.path,
                    label: 'Sign in with email',
                  ),
                  _SignInButton(
                    onPressed: ref
                        .read(socialSignInControllerProvider.notifier)
                        .signInWithGoogle,
                    image: Assets.icons.google.path,
                    label: 'Sign in with Google',
                  ),
                  _SignInButton(
                    onPressed: ref
                        .read(socialSignInControllerProvider.notifier)
                        .signInWithFacebook,
                    image: Assets.icons.facebook.path,
                    label: 'Sign in with Facebook',
                  ),
                  _SignInButton(
                    onPressed: ref
                        .read(socialSignInControllerProvider.notifier)
                        .signInWithMicrosoft,
                    image: Assets.icons.microsoft.path,
                    label: 'Sign in with Microsoft',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New here?'),
                TextButton(
                  onPressed: () => LCoordinator.showAccountCreateScreen(),
                  child: const Text('Create an account'),
                )
              ],
            ),
            Gaps.h32,
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.onPressed,
    required this.image,
    required this.label,
  });

  final VoidCallback onPressed;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 70,
        minWidth: 700,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox.square(
                dimension: UiParameters.iconSize,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          label: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
