import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'app_router.dart';

class LCoordinator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static String get location => GoRouter.of(context).location;

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void onBack([Object? result]) {
    if (canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  static void pushNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.pushNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void goNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void pushReplacementNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.pushReplacementNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void showForgotPasswordScreen(String? email) {
    pushNamed(
      LRoute.forgotPassword.name,
      extra: email,
    );
  }

  static void showEmailSignInScreen() {
    goNamed(
      LRoute.signInWithEmail.name,
    );
  }

  static void showSignInScreen({bool isPushed = false}) {
    isPushed
        ? pushNamed(LRoute.signIn.name)
        : goNamed(
            LRoute.signIn.name,
          );
  }

  static void showAccountCreateScreen() {
    goNamed(LRoute.accountCreate.name);
  }

  static void showSettingsScreen() {
    goNamed(LRoute.settings.name);
  }

  static void showCloseAccountConfirmationScreen() {
    goNamed(LRoute.closeAccountConfirmation.name);
  }

  static void showWelcomeScreen() {
    goNamed(LRoute.welcome.name);
  }

  static void showHomeScreen() {
    goNamed(LRoute.home.name);
  }
}
