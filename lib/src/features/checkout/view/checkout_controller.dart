import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/checkout_service.dart';
import '../model/order.dart';

final checkoutControllerProvider =
    StateNotifierProvider.autoDispose<CheckoutController, AsyncValue<void>>(
        (ref) {
  final checkoutService = ref.watch(checkoutServiceProvider);
  return CheckoutController(checkoutService);
});

class CheckoutController extends StateNotifier<AsyncValue<void>> {
  CheckoutController(this._checkoutService) : super(const AsyncData(null));

  final CheckoutService _checkoutService;

  void onBuyButtonPressed(LOrder order,
      {required void Function() onPaymentSuccessful}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _checkoutService.initPayment(order);
      await _checkoutService.showPaymentSheet(order);
    });
    if (!state.hasError) {
      onPaymentSuccessful();
    }
  }
}
