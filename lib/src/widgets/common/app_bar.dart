import 'package:flutter/material.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../features/cart/view/cart_icon/cart_icon.dart';

class LAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: const [CartIcon()],
    );
  }

  @override
  Size get preferredSize => UiParameters.appBarSize;
}
