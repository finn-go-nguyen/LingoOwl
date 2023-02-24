import 'package:flutter/material.dart';

import '../../constants/app_parameters/app_parameters.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.iconData,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
  });

  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40.0,
      child: ClipRRect(
        borderRadius: UiParameters.circleBorderRadius,
        child: ColoredBox(
          color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: Icon(
              iconData,
              size: 20.0,
              color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
