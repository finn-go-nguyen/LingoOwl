import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/authentication_repository.dart';

final accountCreateScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountCreateScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return AccountCreateScreenController(authRepository);
});

class AccountCreateScreenController extends StateNotifier<AsyncValue<void>> {
  AccountCreateScreenController(this._authenticationRepository)
      : super(const AsyncData(null));

  final AuthenticationRepository _authenticationRepository;

  void onSubmitted({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authenticationRepository.createUserWithEmailAndPassword(
              email: email,
              password: password,
            ));
  }
}
