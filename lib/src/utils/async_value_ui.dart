import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUi on AsyncValue {
  void showError(BuildContext context, {String? errorMessage}) {
    if (!isRefreshing && hasError) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              errorMessage ?? error.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            ),
            duration: const Duration(seconds: 8),
          ),
        );
    }
  }

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
}
