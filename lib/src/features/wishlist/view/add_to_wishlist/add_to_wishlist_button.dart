import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../data/wishlist_repository.dart';
import 'add_to_wishlist_controller.dart';

class AddToWishlistButton extends ConsumerWidget {
  const AddToWishlistButton({
    super.key,
    required this.id,
  });

  final CourseId id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addToWishlistControllerProvider, (previous, next) {
      next.showError(context);
    });

    final state = ref.watch(addToWishlistControllerProvider);
    final isAddedToWishlist = ref.watch(isAddedToWishlistProvider(id));
    return OutlinedButton(
      onPressed: state.isLoading
          ? null
          : () => ref
              .read(addToWishlistControllerProvider.notifier)
              .toggleWishlist(id, isAddToList: !isAddedToWishlist),
      child: state.maybeWhen(
        loading: () => const LoadingState(dimension: 20),
        orElse: () => Text(
          isAddedToWishlist ? 'Wishlisted' : 'Add to wishlist',
        ),
      ),
    );
  }
}
