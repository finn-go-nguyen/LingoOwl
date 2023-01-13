import 'package:flutter/material.dart';

class LScaffold extends StatelessWidget {
  const LScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (_) {
        _hideKeyboard(context);
      },
      child: Scaffold(
        body: SafeArea(child: child),
      ),
    );
  }
}

void _hideKeyboard(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}
