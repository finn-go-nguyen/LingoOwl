import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../profile/application/user_service.dart';

final socialSignInControllerProvider =
    StateNotifierProvider<SocialSignInController, AsyncValue<void>>((ref) {
  final userService = ref.watch(userServiceProvider);
  return SocialSignInController(userService);
});

class SocialSignInController extends StateNotifier<AsyncValue<void>> {
  SocialSignInController(this._userService) : super(const AsyncData(null));

  final UserService _userService;

  void signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _userService.signInWithGoogle());
  }

  void signInWithFacebook() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _userService.signInWithFacebook());
  }

  void signInWithMicrosoft() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _userService.signInWithMicrosoft());
  }
}
