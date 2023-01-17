import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/data/authentication_repository.dart';
import '../features/authentication/view/create_account/account_create_screen.dart';
import '../features/authentication/view/email_password_sign_in/email_password_sign_in_screen.dart';
import '../features/authentication/view/sign_in/sign_in_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/welcome/view/welcome_screen.dart';
import '../utils/refresh_listenable.dart';

enum LRoute {
  welcome,
  home,
  signIn,
  signInWithEmail,
  accountCreate,
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
      final isSignedIn = ref.watch(authenticationRepositoryProvider).isSignedIn;
      if (isSignedIn) {
        if (state.location.contains(RegExp(r'welcome|signIn'))) {
          return '/';
        }
      } else {}
      return null;
    },
    routes: [
      GoRoute(
        name: LRoute.welcome.name,
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: LRoute.home.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: LRoute.signIn.name,
        path: '/signIn',
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
  );
});
