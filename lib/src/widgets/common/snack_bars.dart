import 'package:flutter/material.dart';

import '../../router/coordinator.dart';

class LSnackBar {
  static BuildContext get _context => LCoordinator.context;
  static ColorScheme get _colorScheme => Theme.of(_context).colorScheme;
  static TextTheme get _textTheme => Theme.of(_context).textTheme;
  static TextStyle? get _textStyle => _textTheme.labelLarge;

  static SnackBar failure({required String errorMessage}) => SnackBar(
        showCloseIcon: true,
        closeIconColor: _colorScheme.onError,
        backgroundColor: _colorScheme.error,
        content: Text(
          errorMessage,
          style: _textStyle?.copyWith(
            color: _colorScheme.onError,
          ),
        ),
        duration: const Duration(seconds: 8),
      );
  static SnackBar success({required String content}) => SnackBar(
        showCloseIcon: true,
        content: Text(
          content,
          style: _textStyle?.copyWith(color: _colorScheme.onPrimary),
        ),
      );

  static SnackBar warning({required String content}) => SnackBar(
        showCloseIcon: true,
        closeIconColor: _colorScheme.onErrorContainer,
        backgroundColor: _colorScheme.errorContainer,
        content: Text(
          content,
          style: _textTheme.bodyMedium?.copyWith(
            color: _colorScheme.onErrorContainer,
          ),
        ),
      );
}
