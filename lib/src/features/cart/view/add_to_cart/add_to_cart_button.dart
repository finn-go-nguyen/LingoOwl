import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../application/cart_service.dart';
import 'add_to_cart_controller.dart';

class AddToCartButton extends ConsumerWidget {
  const AddToCartButton({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addToCartControllerProvider, (previous, next) {
      next.showError(context);
    });

    final state = ref.watch(addToCartControllerProvider);
    final isAddedToCart = ref.watch(isAddedToCartProvider(courseId));
    return isAddedToCart
        ? OutlinedButton(
            onPressed: state.isLoading ? null : LCoordinator.showCartScreen,
            child: state.maybeWhen(
              loading: () => const LoadingState(dimension: 20),
              orElse: () => const Text('Go to cart'),
            ),
          )
        : OutlinedButton(
            onPressed: state.isLoading
                ? null
                : () => ref
                    .read(addToCartControllerProvider.notifier)
                    .addToCart(courseId),
            child: state.maybeWhen(
              loading: () => const LoadingState(dimension: 20),
              orElse: () => const Text('Add to cart'),
            ),
          );
  }
}
