import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/app_sizes.dart';
import 'email_password_sign_in_controller.dart';

import '../../../../widgets/common/scaffold.dart';

class EmailPasswordSignInScreen extends StatefulWidget {
  const EmailPasswordSignInScreen({super.key});

  @override
  State<EmailPasswordSignInScreen> createState() =>
      _EmailPasswordSignInScreenState();
}

class _EmailPasswordSignInScreenState extends State<EmailPasswordSignInScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      child: SizedBox.expand(
        child: Padding(
          padding: Sizes.screenPadding,
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
              Consumer(
                builder: (context, ref, child) => PasswordInputView(
                  onSubmitted: ref
                      .read(emailPasswordSignInControllerProvider.notifier)
                      .signInWithEmailAndPassword,
                ),
              ),
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
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontFamily: GoogleFonts.ebGaramond().fontFamily,
              ),
        ),
        Gaps.h20,
        Text(
          'Enter your email to sign in to your account',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Gaps.h64,
        TextFormField(
          onChanged: ref
              .read(emailPasswordSignInControllerProvider.notifier)
              .onEmailChanged,
          autofocus: true,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        Gaps.h24,
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
              onPressed: onNextPressed,
              child: Text(
                'Next',
                style: Theme.of(context).textTheme.button!,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PasswordInputView extends ConsumerWidget {
  const PasswordInputView({
    super.key,
    required this.onSubmitted,
  });

  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LScaffold(
      child: SizedBox.expand(
        child: Padding(
          padding: Sizes.screenPadding,
          child: Column(
            children: [
              Gaps.h64,
              Text(
                'Almost there!',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontFamily: GoogleFonts.ebGaramond().fontFamily,
                    ),
              ),
              Gaps.h20,
              Consumer(
                builder: (context, ref, child) {
                  final email =
                      ref.watch(emailPasswordSignInControllerProvider).email;
                  return Text(
                    'Enter your password to sign in with\n$email',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              ),
              Gaps.h64,
              TextFormField(
                onChanged: ref
                    .read(emailPasswordSignInControllerProvider.notifier)
                    .onPasswordChanged,
                autofocus: true,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password (8+ characters)',
                  suffix: IconButton(
                    onPressed: onSubmitted,
                    icon: const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Gaps.h24,
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: Consumer(
                    builder: (context, ref, child) {
                      var status = ref
                          .watch(emailPasswordSignInControllerProvider)
                          .status;
                      return ElevatedButton(
                        onPressed: status.isLoading ? null : onSubmitted,
                        child: status.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                'Sign In',
                                style: Theme.of(context).textTheme.button!,
                              ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
