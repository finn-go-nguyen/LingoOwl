import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../application/cart_service.dart';

final cartControllerProvider =
    StateNotifierProvider<CartController, AsyncValue<void>>((ref) {
  final cartService = ref.watch(cartServiceProvider);
  return CartController(cartService);
});

class CartController extends StateNotifier<AsyncValue<void>> {
  CartController(this._cartService) : super(const AsyncData(null));

  final CartService _cartService;

  void remove(CourseId id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _cartService.removeCourse(id));
  }
}
