import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain_manager.dart';

import '../../data/authentication_repository.dart';
import 'email_password_sign_in_state.dart';

final emailPasswordSignInControllerProvider = StateNotifierProvider.autoDispose<
    EmailPasswordSignInController, EmailPasswordSignInState>(
  (ref) {
    final authRepository =
        ref.watch(DomainManager.instance.authRepositoryProvider);
    return EmailPasswordSignInController(authRepository);
  },
);

class EmailPasswordSignInController
    extends StateNotifier<EmailPasswordSignInState> {
  EmailPasswordSignInController(this._authenticationRepository)
      : super(const EmailPasswordSignInState());

  final AuthenticationRepository _authenticationRepository;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void toggleObscureText() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  void signInWithEmailAndPassword(String password) async {
    state = state.copyWith(status: const AsyncLoading());
    final value = await AsyncValue.guard(
      () => _authenticationRepository.signInWithEmailAndPassword(
        email: state.email,
        password: password,
      ),
    );
    state = state.copyWith(status: value);
  }
}
