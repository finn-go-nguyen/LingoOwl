import 'package:flutter/material.dart';

class LScaffold extends StatelessWidget {
  const LScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.onRefresh,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (_) {
        _hideKeyboard(context);
      },
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: onRefresh == null
              ? body
              : RefreshIndicator(
                  onRefresh: onRefresh!,
                  child: body,
                ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
      ),
    );
  }
}

void _hideKeyboard(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}
