import 'package:flutter/material.dart';

import '../../router/coordinator.dart';

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [
        if (cancelActionText != null)
          TextButton(
            child: Text(cancelActionText),
            onPressed: () => LCoordinator.onBack(false),
          ),
        TextButton(
          child: Text(defaultActionText),
          onPressed: () => LCoordinator.onBack(true),
        ),
      ],
    ),
  );
}
