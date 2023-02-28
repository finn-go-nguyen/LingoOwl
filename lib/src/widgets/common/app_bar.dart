import 'package:flutter/material.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../features/cart/view/cart_icon_button/cart_icon_button.dart';

class LAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
  });

  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      automaticallyImplyLeading: leading == null,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => UiParameters.appBarSize;
}

class LAppBarWithCartIconButton extends LAppBar {
  const LAppBarWithCartIconButton({super.key, required super.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: const [CartIconButton()],
    );
  }
}
