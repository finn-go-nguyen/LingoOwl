import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../profile/application/user_service.dart';
import 'account_create_form_state.dart';

final accountCreateScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountCreateScreenController, AccountCreateFormState>((ref) {
  final userService = ref.watch(userServiceProvider);
  return AccountCreateScreenController(userService);
});

class AccountCreateScreenController
    extends StateNotifier<AccountCreateFormState> {
  AccountCreateScreenController(this._userService)
      : super(const AccountCreateFormState());

  final UserService _userService;

  void onSubmitted({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(status: const AsyncLoading());
    state = state.copyWith(
      status: await AsyncValue.guard(
        () => _userService.createUserWithEmailAndPassword(
          name: name,
          email: email,
          password: password,
        ),
      ),
    );
  }

  void toggleObscureText() {
    state = state.copyWith(obscureText: !state.obscureText);
  }
}
