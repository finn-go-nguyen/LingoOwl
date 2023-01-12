import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/authentication_repository.dart';
import 'email_password_sign_in_state.dart';

final emailPasswordSignInControllerProvider = StateNotifierProvider<
    EmailPasswordSignInController, EmailPasswordSignInState>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return EmailPasswordSignInController(authRepository);
});

class EmailPasswordSignInController
    extends StateNotifier<EmailPasswordSignInState> {
  EmailPasswordSignInController(this._authenticationRepository)
      : super(const EmailPasswordSignInState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void signInWithEmailAndPassword() async {
    state = state.copyWith(status: const AsyncLoading());
    final value = await AsyncValue.guard(
      () => _authenticationRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      ),
    );
    state = state.copyWith(status: value);
  }
}
