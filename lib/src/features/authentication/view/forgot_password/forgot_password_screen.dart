import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/scaffold.dart';
import 'forgot_password_controller.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ref.listen(forgotPasswordControllerProvider, (_, next) {
      next.showError(context);
    });

    return PageView(
      controller: _pageController,
      // * Disable swiping between pages
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ForgotPasswordView(
          onSubmitted: () => _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          ),
          email: widget.email,
        ),
        ResetPasswordEmailSentView(
          onTryAnotherEmailPressed: () => _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          ),
        ),
      ],
    );
  }
}

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({
    super.key,
    this.email,
    required this.onSubmitted,
  });

  final String? email;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      body: SingleChildScrollView(
        padding: UiParameters.screenPadding,
        child: Column(
          children: [
            Gaps.h64,
            Text(
              'Reset password',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontFamily: GoogleFonts.ebGaramond().fontFamily,
                  ),
            ),
            Gaps.h16,
            const Text(
              'Enter the email associated with your account and we will send you a link to reset your password',
              textAlign: TextAlign.center,
            ),
            Gaps.h32,
            ForgotPasswordForm(
              onResetEmailSent: onSubmitted,
              email: email,
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordEmailSentView extends StatelessWidget {
  const ResetPasswordEmailSentView({
    super.key,
    required this.onTryAnotherEmailPressed,
  });

  final VoidCallback onTryAnotherEmailPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: LScaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: UiParameters.screenPadding,
            child: Column(
              children: [
                Gaps.h64,
                LottieBuilder.asset(
                  Assets.lotties.sent,
                  repeat: false,
                ),
                Gaps.h12,
                Text(
                  'We have sent a password recover instructions to your email.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Gaps.h32,
                ElevatedButton(
                  onPressed: () {
                    _onOpenMailAppPressed();
                    LCoordinator.showEmailSignInScreen();
                  },
                  child: Text(
                    'Open email app',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Gaps.h20,
                TextButton(
                  onPressed: () => LCoordinator.showSignInScreen(),
                  child: const Text(
                    'Skip, I\'ll confirm later',
                  ),
                ),
                const Spacer(),
                const Text(
                    'Did not receive the email? Check your spam filter,'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('or'),
                    TextButton(
                      onPressed: onTryAnotherEmailPressed,
                      child: const Text('try another email address'),
                    )
                  ],
                ),
                Gaps.h32,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onOpenMailAppPressed() {
    if (Platform.isAndroid) {
      AndroidIntent intent = const AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: 'android.intent.category.APP_EMAIL',
        flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      intent.launch();
    }
  }
}
