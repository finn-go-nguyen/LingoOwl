import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../router/coordinator.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.screenPadding,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Add courses'),
                  Text('Your cart is empty'),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: LCoordinator.showHomeScreen,
              child: Text('Browse courses'),
            ),
          ),
          Gaps.h16,
        ],
      ),
    );
  }
}
