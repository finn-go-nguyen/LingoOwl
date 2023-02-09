import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/app_parameters/ui_parameters.dart';
import '../../../../constants/forms/error_text.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/scaffold.dart';
import '../../../../widgets/common/term_privacy.dart';
import 'email_password_sign_in_controller.dart';
import 'email_password_sign_in_form.dart';

class EmailPasswordSignInScreen extends ConsumerStatefulWidget {
  const EmailPasswordSignInScreen({super.key});

  @override
  ConsumerState<EmailPasswordSignInScreen> createState() =>
      _EmailPasswordSignInScreenState();
}

class _EmailPasswordSignInScreenState
    extends ConsumerState<EmailPasswordSignInScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(emailPasswordSignInControllerProvider, (previous, next) {
      next.status.showError(context,
          errorMessage: ErrorTextConstants.wrongPasswordOrUserNotFound);
    });
    return LScaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: UiParameters.screenPadding,
          child: PageView(
            // * Disable swiping between pages
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              EmailInputView(
                onNextPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                  );
                },
              ),
              const PasswordInputView()
            ],
          ),
        ),
      ),
    );
  }
}

class EmailInputView extends ConsumerWidget {
  const EmailInputView({
    super.key,
    required this.onNextPressed,
  });

  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Gaps.h64,
        Text(
          'Welcome back!',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: GoogleFonts.ebGaramond().fontFamily,
              ),
        ),
        Gaps.h20,
        Text(
          'Enter your email to sign in to your account',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Gaps.h64,
        EmailForm(
          onSubmitted: onNextPressed,
        ),
        const Spacer(),
        const TermPrivacy(),
        Gaps.h32,
      ],
    );
  }
}

class PasswordInputView extends ConsumerWidget {
  const PasswordInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Gaps.h64,
        Text(
          'Almost there!',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: GoogleFonts.ebGaramond().fontFamily,
              ),
        ),
        Gaps.h20,
        Consumer(
          builder: (context, ref, child) {
            final email = ref.watch(emailPasswordSignInControllerProvider
                .select((value) => value.email));
            return Text(
              'Enter your password to sign in with\n$email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            );
          },
        ),
        Gaps.h64,
        const PasswordForm(),
      ],
    );
  }
}
