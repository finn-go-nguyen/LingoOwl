import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../constants/type_defs/type_defs.dart';
import 'app_router.dart';

class LCoordinator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();
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
      LRoutes.forgotPassword.name,
      extra: email,
    );
  }

  static void showEmailSignInScreen() {
    goNamed(
      LRoutes.signInWithEmail.name,
    );
  }

  static void showSignInScreen({bool isPushed = false}) {
    isPushed
        ? pushNamed(LRoutes.signIn.name)
        : goNamed(
            LRoutes.signIn.name,
          );
  }

  static void showAccountCreateScreen() {
    goNamed(LRoutes.accountCreate.name);
  }

  static void showSettingsScreen() {
    goNamed(LRoutes.settings.name);
  }

  static void showCloseAccountConfirmationScreen() {
    goNamed(LRoutes.closeAccountConfirmation.name);
  }

  static void showWelcomeScreen() {
    goNamed(LRoutes.welcome.name);
  }

  static void showHomeScreen() {
    goNamed(LRoutes.home.name);
  }

  static void showCourseDetailsScreen(String courseId) {
    pushNamed(
      LRoutes.course.name,
      queryParams: <String, CourseId>{'courseId': courseId},
    );
  }

  static void showCartScreen() {
    pushNamed(LRoutes.cart.name);
  }

  static void showSeeMoreReviewsScreen(
    String title,
    CourseId courseId,
  ) {
    goNamed(
      LRoutes.reviews.name,
      extra: title,
      queryParams: <String, CourseId>{'courseId': courseId},
    );
  }

  static void showLeaveReviewScreen(CourseId courseId) {
    pushNamed(LRoutes.leaveReview.name, extra: courseId);
  }

  static void showLectureScreen(CourseId courseId) {
    goNamed(LRoutes.lecture.name, extra: courseId);
  }

  static void showNoteScreen(CourseId courseId) {
    goNamed(LRoutes.notes.name, extra: courseId);
  }
}
