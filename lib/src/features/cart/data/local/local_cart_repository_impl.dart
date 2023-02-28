import '../../model/cart.dart';
import 'local_cart_collection_reference.dart';
import 'local_cart_repository.dart';

class LocalCartRepositoryImpl implements LocalCartRepository {
  final ref = LocalCartCollectionReference();

  Future<void> init() => ref.init();

  @override
  Future<LCart> fetchCart() async {
    final cart = await ref.get();
    return cart ?? const LCart();
  }

  @override
  Future<void> setCart(LCart cart) {
    return ref.set(cart);
  }

  @override
  Stream<LCart> watchCart() {
    return ref.snapshots().map(
      (value) {
        if (value == null) return const LCart();
        return value;
      },
    );
  }

  // call this when the DB is no longer needed
  void dispose() => ref.dispose();
}
