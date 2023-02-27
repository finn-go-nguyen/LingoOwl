import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_course_app/src/utils/logger.dart';

import '../router/coordinator.dart';
import '../widgets/common/snack_bars.dart';

extension AsyncValueUi on AsyncValue {
  void showError(BuildContext context, {String? errorMessage}) {
    if (!isRefreshing && hasError) {
      if (error is! FirebaseException) {
        log.e(
          '-------ERROR-------',
          error,
          stackTrace,
        );
        return;
      }

      final firebaseError = error as FirebaseException;

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          LSnackBar.failure(
            errorMessage: errorMessage ??
                firebaseError.message ??
                'An error has occurred!',
          ),
        );
    }
  }

  void showLoadingDialog(BuildContext context, AsyncValue<dynamic>? previous) {
    if (isLoading) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if ((previous?.isLoading ?? false) && !isLoading) {
      LCoordinator.onBack();
    }
  }

  void showSuccess(BuildContext context, {required String content}) {
    if (!isRefreshing && hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(LSnackBar.success(content: content));
    }
  }

  void showErrorLoadingSuccessState(
    BuildContext context, {
    required AsyncValue<dynamic>? previousState,
    String? errorMessage,
    required String successMessage,
  }) {
    showError(context);
    showLoadingDialog(context, previousState);
    showSuccess(context, content: successMessage);
  }
}
