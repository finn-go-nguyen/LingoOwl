import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logger.dart';
import '../../data/authentication_repository.dart';

final forgotPasswordControllerProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordController, AsyncValue<void>>((ref) {
  log.d('ForgotPasswordController created');
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return ForgotPasswordController(authRepository);
});

class ForgotPasswordController extends StateNotifier<AsyncValue<void>> {
  ForgotPasswordController(this._authenticationRepository)
      : super(const AsyncData(null));

  final AuthenticationRepository _authenticationRepository;

  /// return true if password was sent
  Future<bool> resetPassword(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authenticationRepository.resetPassword(email));
    return !state.hasError;
  }

  @override
  void dispose() {
    log.d('ForgotPasswordController dispose');
    super.dispose();
  }
}
