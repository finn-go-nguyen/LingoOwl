import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';
import '../../authentication/model/auth_user.dart';
import '../model/cart.dart';
import '../model/mutable_cart.dart';

final cartSyncServiceProvider = Provider<CartSyncService>((ref) {
  return CartSyncService(ref: ref);
});

class CartSyncService {
  CartSyncService({
    required this.ref,
  }) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<LAuthUser?>>(authStateChangeStreamProvider,
        (previous, next) {
      final previousUser = previous?.value;
      final user = next.value;
      if (previousUser == null && user != null) {
        _moveItemsToRemoteCart(user.id);
      }
    });
  }

  /// moves all items from the local to the remote cart
  Future<void> _moveItemsToRemoteCart(String uid) async {
    try {
      // Get the local cart data
      final localCartRepository =
          ref.read(DomainManager.instance.localCartRepositoryProvider);
      final localCart = await localCartRepository.fetchCart();
      if (localCart.courses.isNotEmpty) {
        // Get the remote cart data
        final remoteCartRepository =
            ref.read(DomainManager.instance.remoteCartRepositoryProvider);
        final remoteCart = await remoteCartRepository.fetchCart(uid);
        // Add all the local items to the remote cart
        final updatedRemoteCart = remoteCart.addItems(localCart.courses);
        // Write the updated remote cart data to the repository
        await remoteCartRepository.setCart(uid, updatedRemoteCart);
        // Remove all items from the local cart
        await localCartRepository.setCart(const LCart());
      }
    } catch (e) {
      rethrow;
    }
  }
}
