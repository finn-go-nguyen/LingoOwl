import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../profile/application/user_service.dart';

final accountCreateScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountCreateScreenController, AsyncValue<void>>((ref) {
  final userService = ref.watch(userServiceProvider);
  return AccountCreateScreenController(userService);
});

class AccountCreateScreenController extends StateNotifier<AsyncValue<void>> {
  AccountCreateScreenController(this._userService)
      : super(const AsyncData(null));

  final UserService _userService;

  void onSubmitted({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _userService.createUserWithEmailAndPassword(
              name: name,
              email: email,
              password: password,
            ));
  }
}
