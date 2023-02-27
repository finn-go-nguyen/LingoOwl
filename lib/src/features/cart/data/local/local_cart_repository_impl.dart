import 'dart:convert';

import '../../model/cart.dart';
import 'local_cart_repository.dart';
import 'local_cart_collection_reference.dart';

class LocalCartRepositoryImpl implements LocalCartRepository {
  final ref = LocalCartCollectionReference();

  Future<void> init() => ref.init();

  @override
  Future<LCart> fetchCart() async {
    final cartJson = await ref.get();
    if (cartJson == null) return const LCart();
    return LCart.fromJson(jsonDecode(cartJson));
  }

  @override
  Future<void> setCart(LCart cart) {
    return ref.set(cart.toJson());
  }

  @override
  Stream<LCart> watchCart() {
    return ref.snapshots().map(
      (event) {
        if (event == null) return const LCart();
        return LCart.fromJson(jsonDecode(event));
      },
    );
  }

  // call this when the DB is no longer needed
  void dispose() => ref.dispose();
}
