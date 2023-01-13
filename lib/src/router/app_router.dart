import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/src/features/authentication/data/authentication_repository.dart';
import 'package:online_course_app/src/features/authentication/view/sign_in/sign_in_screen.dart';
import 'package:online_course_app/src/features/authentication/view/sign_in/email_password_sign_in_screen.dart';
import 'package:online_course_app/src/features/home/view/home_screen.dart';
import 'package:online_course_app/src/utils/refresh_listenable.dart';
import '../features/welcome/view/welcome_screen.dart';

enum LRoute {
  welcome,
  home,
  signIn,
  signInWithEmail,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/signIn',

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
          ]),
    ],
  );
});
