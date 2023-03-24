import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/empty/cart_empty.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../application/cart_service.dart';
import 'cart_item_card.dart';
import 'cart_screen_controller.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(cartControllerProvider, (previous, next) {
      next.showError(context);
    });

    final cartAsync = ref.watch(cartProvider);
    return LScaffold(
      appBar: const LAppBar(title: Text('Cart')),
      body: SizedBox.expand(
        child: cartAsync.when(
          loading: () => const LoadingState(),
          error: (_, __) => const ErrorState(),
          data: (items) {
            final courseIds = items.courses.keys;
            return courseIds.isEmpty
                ? const CartEmpty()
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        items.courses.length,
                        (index) => CartItemCard(
                          onDeleted:
                              ref.read(cartControllerProvider.notifier).remove,
                          courseId: items.courses.keys.elementAt(index),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
