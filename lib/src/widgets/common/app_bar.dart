import 'package:flutter/material.dart';

import '../../constants/app_parameters/app_parameters.dart';

class LAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => UiParameters.appBarSize;
}
