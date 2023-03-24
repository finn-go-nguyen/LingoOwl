import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/coordinator.dart';
import '../../application/cart_service.dart';

class CartIconButton extends ConsumerWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref.watch(cartItemsCountProvider);
    return IconButton(
      onPressed: LCoordinator.showCartScreen,
      icon: Badge.count(
        count: cartItemCount,
        isLabelVisible: cartItemCount != 0,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
