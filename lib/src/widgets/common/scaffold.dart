import 'package:flutter/material.dart';

class LScaffold extends StatelessWidget {
  const LScaffold({
    super.key,
    this.appBar,
    required this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (_) {
        _hideKeyboard(context);
      },
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(child: body),
      ),
    );
  }
}

void _hideKeyboard(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}
