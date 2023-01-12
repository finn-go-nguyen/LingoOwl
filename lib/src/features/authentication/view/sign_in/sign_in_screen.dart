import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course_app/src/features/authentication/view/sign_in/social_sign_in_controller.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../router/app_router.dart';

import '../../../../widgets/common/scaffold.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(socialSignInControllerProvider, (previous, next) {
      if (next.isLoading) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      }

      if ((previous?.isLoading ?? false) && !next.isLoading) {
        if (Navigator.canPop(context)) Navigator.pop(context);
      }

      if (!next.isRefreshing && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error.toString(),
            ),
          ),
        );
      }
    });
    return LScaffold(
      child: SizedBox.expand(
        child: Column(
          children: [
            Gaps.h64,
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontFamily: GoogleFonts.ebGaramond().fontFamily,
                  ),
            ),
            Gaps.h20,
            Text(
              'By using our services you are agreeing to our',
              style: Theme.of(context).textTheme.caption,
            ),
            Gaps.h4,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Terms',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black87,
                        ),
                  ),
                ),
                Text(
                  ' and ',
                  style: Theme.of(context).textTheme.caption,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Privacy Statement',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: Sizes.screenPadding,
              child: Column(
                children: [
                  _SignInButton(
                    onPressed: () =>
                        context.goNamed(LRoute.signInWithEmail.name),
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
                    onPressed: () {},
                    image: Assets.icons.apple.path,
                    label: 'Sign in with Apple',
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
                  onPressed: () {},
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
                dimension: Sizes.iconSize,
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
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
