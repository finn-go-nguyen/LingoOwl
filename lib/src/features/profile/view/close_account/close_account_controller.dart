import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/user_service.dart';

final closeAccountControllerProvider =
    StateNotifierProvider<CloseAccountController, AsyncValue<void>>((ref) {
  return CloseAccountController(ref);
});

class CloseAccountController extends StateNotifier<AsyncValue<void>> {
  CloseAccountController(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  void closeAccount(String password) async {
    state = const AsyncLoading();
    final userService = _ref.read(userServiceProvider);
    state = await userService.closeAccount(password);
  }
}
