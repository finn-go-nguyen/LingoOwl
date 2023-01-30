import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/data/authentication_repository.dart';

final changePasswordControllerProvider =
    StateNotifierProvider<ChangePasswordController, AsyncValue<void>>((ref) {
  return ChangePasswordController(ref);
});

class ChangePasswordController extends StateNotifier<AsyncValue<void>> {
  ChangePasswordController(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  void changePassword(String currentPassword, String newPassword) async {
    state = const AsyncLoading();
    final authRepository = _ref.read(authenticationRepositoryProvider);

    state = await AsyncValue.guard(() => authRepository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ));
  }
}
