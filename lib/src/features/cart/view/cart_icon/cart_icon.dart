import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/coordinator.dart';
import '../../application/cart_service.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref.watch(cartItemsCountProvider);
    return IconButton(
      onPressed: LCoordinator.showCartScreen,
      icon: Badge.count(
        count: cartItemCount,
        isLabelVisible: cartItemCount != 0,
        child: const Icon(Icons.shopping_bag_outlined),
      ),
    );
  }
}
