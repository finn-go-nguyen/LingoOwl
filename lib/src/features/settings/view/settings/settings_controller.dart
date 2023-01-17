import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/data/authentication_repository.dart';

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return SettingsController(authRepository);
});

class SettingsController extends StateNotifier<AsyncValue<void>> {
  SettingsController(this._authenticationRepository)
      : super(const AsyncData(null));

  final AuthenticationRepository _authenticationRepository;

  /// return true if sign out successfully
  Future<bool> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _authenticationRepository.signOut());
    return !state.hasError;
  }
}
