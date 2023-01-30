import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication/data/authentication_repository.dart';

import '../constants/app_constants/home_navigation_items.dart';
import '../domain_manager.dart';
import '../features/authentication/view/create_account/account_create_screen.dart';
import '../features/authentication/view/email_password_sign_in/email_password_sign_in_screen.dart';
import '../features/authentication/view/forgot_password/forgot_password_screen.dart';
import '../features/authentication/view/sign_in/sign_in_screen.dart';
import '../features/home/model/home_navigation_item.dart';
import '../features/home/view/scaffold_with_bottom_navigation_bar.dart';
import '../features/profile/view/account_security/account_security_view.dart';
import '../features/profile/view/close_account/close_account_confirmation_screen.dart';
import '../features/profile/view/close_account/close_account_view.dart';
import '../features/profile/view/photo/photo_view.dart';
import '../features/profile/view/profile/profile_view.dart';
import '../features/profile/view/profile_details_screen.dart';
import '../features/welcome/view/welcome_screen.dart';
import '../utils/refresh_listenable.dart';
import '../widgets/state/unimplemented.dart';
import 'coordinator.dart';

enum LRoutes {
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
  closeAccountConfirmation,
  search,
  myLearning,
  wishlist;

  bool get isProfileDetailsSubRoute =>
      this == LRoutes.profile || this == LRoutes.accountSecurity;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final homePath = HomeNavigationItems.items[0].path;
  return GoRouter(
    navigatorKey: LCoordinator.navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/welcome',

    /// Every time the [stream] receives an event the [GoRouter] will refresh its
    /// current route.
    refreshListenable:
        RefreshListenable(ref.watch(authStateChangeStreamProvider.stream)),
    redirect: (context, state) {
      final isSignedIn = ref.watch(DomainManager.instance.authRepositoryProvider
          .select((value) => value.isSignedIn));
      if (isSignedIn) {
        if (state.location.contains(RegExp(r'welcome|signIn'))) {
          return homePath;
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
        name: LRoutes.welcome.name,
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
        routes: [
          GoRoute(
            name: LRoutes.signIn.name,
            path: 'signIn',
            builder: (context, state) => const SignInScreen(),
            routes: [
              GoRoute(
                name: LRoutes.signInWithEmail.name,
                path: 'email',
                builder: (context, state) => const EmailPasswordSignInScreen(),
              ),
              GoRoute(
                name: LRoutes.accountCreate.name,
                path: 'create',
                builder: (context, state) => const AccountCreateScreen(),
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        builder: (_, state, child) {
          return ScaffoldWithBottomNavigationBar(child: child);
        },
        routes: [
          _bottomNavigationItemBuilder(HomeNavigationItems.items[0], ref),
          _bottomNavigationItemBuilder(HomeNavigationItems.items[1], ref),
          _bottomNavigationItemBuilder(HomeNavigationItems.items[2], ref),
          _bottomNavigationItemBuilder(HomeNavigationItems.items[3], ref),
          _bottomNavigationItemBuilder(
            HomeNavigationItems.items[4],
            ref,
            routes: [
              GoRoute(
                name: LRoutes.profile.name,
                path: 'profile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileDetailsScreen(
                    current: LRoutes.profile,
                    child: ProfileView(),
                  ),
                ),
              ),
              GoRoute(
                name: LRoutes.photo.name,
                path: 'photo',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileDetailsScreen(
                    current: LRoutes.photo,
                    child: PhotoView(),
                  ),
                ),
              ),
              GoRoute(
                name: LRoutes.accountSecurity.name,
                path: 'security',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileDetailsScreen(
                    current: LRoutes.accountSecurity,
                    child: AccountSecurityView(),
                  ),
                ),
              ),
              GoRoute(
                name: LRoutes.closeAccount.name,
                path: 'close',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileDetailsScreen(
                    current: LRoutes.closeAccount,
                    child: CloseAccountView(),
                  ),
                ),
                routes: [
                  GoRoute(
                    name: LRoutes.closeAccountConfirmation.name,
                    path: 'confirm',
                    builder: (context, state) =>
                        const CloseAccountConfirmationScreen(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: LRoutes.forgotPassword.name,
        path: '/forgotPassword',
        builder: (context, state) =>
            ForgotPasswordScreen(email: state.extra as String?),
      ),
      GoRoute(
        name: LRoutes.unimplemented.name,
        path: '/unimplemented',
        builder: (context, state) => const Unimplemented(),
      ),
    ],
  );
});

GoRoute _bottomNavigationItemBuilder(HomeNavigationItem item, Ref ref,
        {List<RouteBase> routes = const <RouteBase>[]}) =>
    GoRoute(
      path: item.path,
      name: item.route.name,
      pageBuilder: (_, __) {
        return NoTransitionPage(
          child: item.view,
        );
      },
      routes: routes,
    );
