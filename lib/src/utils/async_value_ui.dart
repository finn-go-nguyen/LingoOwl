import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common/snack_bars.dart';

extension AsyncValueUi on AsyncValue {
  void showError(BuildContext context, {String? errorMessage}) {
    if (!isRefreshing && hasError) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          LSnackBar.failure(
            errorMessage: errorMessage ?? error.toString(),
          ),
        );
    }
  }

  // TODO: Handle will pop
  void showLoadingDialog(BuildContext context, AsyncValue<dynamic>? previous) {
    if (isLoading) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
    }

    if ((previous?.isLoading ?? false) && !isLoading) {
      if (Navigator.canPop(context)) Navigator.pop(context);
    }
  }

  void showSuccess(BuildContext context, {required String content}) {
    if (!isRefreshing && hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(LSnackBar.success(content: content));
    }
  }
}
