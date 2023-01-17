import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUi on AsyncValue {
  void showError(BuildContext context) {
    if (!isRefreshing && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }
}
