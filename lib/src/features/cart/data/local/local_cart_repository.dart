import '../../model/cart.dart';

abstract class LocalCartRepository {
  Future<LCart> fetchCart();
  Stream<LCart> watchCart();
  Future<void> setCart(LCart cart);
}
