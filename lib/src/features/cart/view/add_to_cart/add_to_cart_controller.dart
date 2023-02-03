import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../application/cart_service.dart';

final addToCartControllerProvider =
    StateNotifierProvider<AddToCartController, AsyncValue<bool>>((ref) {
  final cartService = ref.watch(cartServiceProvider);
  return AddToCartController(cartService);
});

/// course is added -> state = AsyncData(true)
class AddToCartController extends StateNotifier<AsyncValue<bool>> {
  AddToCartController(this._cartService) : super(const AsyncData(false));

  final CartService _cartService;

  void addToCart(CourseId courseId) async {
    state = const AsyncLoading();
    final asyncResult =
        await AsyncValue.guard(() => _cartService.addCourse(courseId));

    if (asyncResult.hasError) {
      state = asyncResult as AsyncError<bool>;
      return;
    }

    state = const AsyncData(true);
  }
}
