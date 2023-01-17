import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class LSnackBar {
  static SnackBar failure({required String errorMessage}) => SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          contentType: ContentType.failure,
          title: 'Oh Snap!',
          message: errorMessage,
        ),
        duration: const Duration(seconds: 8),
      );
}
