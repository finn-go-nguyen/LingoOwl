import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/profile/view/close_account/close_account_confirmation_screen.dart';
import '../features/profile/view/close_account/close_account_view.dart';
import '../features/profile/view/photo/photo_view.dart';

import '../features/authentication/data/authentication_repository.dart';
import '../features/authentication/view/create_account/account_create_screen.dart';
import '../features/authentication/view/email_password_sign_in/email_password_sign_in_screen.dart';
import '../features/authentication/view/forgot_password/forgot_password_screen.dart';
import '../features/authentication/view/sign_in/sign_in_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/profile/view/account_security/account_security_view.dart';
import '../features/profile/view/profile/profile_view.dart';
import '../features/profile/view/profile_details_screen.dart';
import '../features/settings/view/settings/settings_screen.dart';
import '../features/welcome/view/welcome_screen.dart';
import '../utils/refresh_listenable.dart';
import '../widgets/state/unimplemented.dart';

enum LRoute {
  unimplemented,
  welcome,
  home,
  signIn,
  signInWithEmail,
  accountCreate,
  forgotPassword,
  settings,
  profile,
  photo,
  accountSecurity,
  closeAccount,
  closeAccountConfirmation;

  bool get isProfileDetailsSubRoute =>
      this == LRoute.profile || this == LRoute.accountSecurity;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/welcome',

    /// Every time the [stream] receives an event the [GoRouter] will refresh its
    /// current route.
    refreshListenable: RefreshListenable(
        ref.watch(authenticationRepositoryProvider).authStateChanges()),
    redirect: (context, state) {
      final isSignedIn = ref.watch(
          authenticationRepositoryProvider.select((value) => value.isSignedIn));
      if (isSignedIn) {
        if (state.location.contains(RegExp(r'welcome|signIn'))) {
          return '/';
        }
      } else {
        if (state.location.contains(RegExp(r'profile|photo|security|close'))) {
          return '/welcome';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: LRoute.welcome.name,
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
        routes: [
          GoRoute(
            name: LRoute.signIn.name,
            path: 'signIn',
            builder: (context, state) => const SignInScreen(),
            routes: [
              GoRoute(
                name: LRoute.signInWithEmail.name,
                path: 'email',
                builder: (context, state) => const EmailPasswordSignInScreen(),
              ),
              GoRoute(
                name: LRoute.accountCreate.name,
                path: 'create',
                builder: (context, state) => const AccountCreateScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: LRoute.home.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: LRoute.forgotPassword.name,
        path: '/forgotPassword',
        builder: (context, state) =>
            ForgotPasswordScreen(email: state.extra as String?),
      ),
      GoRoute(
        name: LRoute.settings.name,
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            name: LRoute.profile.name,
            path: 'profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileDetailsScreen(
                current: LRoute.profile,
                child: ProfileView(),
              ),
            ),
          ),
          GoRoute(
            name: LRoute.photo.name,
            path: 'photo',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileDetailsScreen(
                current: LRoute.photo,
                child: PhotoView(),
              ),
            ),
          ),
          GoRoute(
            name: LRoute.accountSecurity.name,
            path: 'security',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileDetailsScreen(
                current: LRoute.accountSecurity,
                child: AccountSecurityView(),
              ),
            ),
          ),
          GoRoute(
            name: LRoute.closeAccount.name,
            path: 'close',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileDetailsScreen(
                current: LRoute.closeAccount,
                child: CloseAccountView(),
              ),
            ),
            routes: [
              GoRoute(
                name: LRoute.closeAccountConfirmation.name,
                path: 'confirm',
                builder: (context, state) =>
                    const CloseAccountConfirmationScreen(),
              )
            ],
          ),
        ],
      ),
      GoRoute(
        name: LRoute.unimplemented.name,
        path: '/unimplemented',
        builder: (context, state) => const Unimplemented(),
      ),
    ],
  );
});
