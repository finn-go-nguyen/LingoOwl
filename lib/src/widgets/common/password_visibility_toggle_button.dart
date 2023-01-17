import 'package:flutter/material.dart';

class PasswordVisibilityToggleButton extends StatelessWidget {
  const PasswordVisibilityToggleButton({
    super.key,
    required this.onPressed,
    this.isShown = false,
  });

  final VoidCallback onPressed;
  final bool isShown;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(isShown ? Icons.visibility : Icons.visibility_off),
    );
  }
}
