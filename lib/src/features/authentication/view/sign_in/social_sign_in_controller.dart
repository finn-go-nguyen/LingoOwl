import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_course_app/src/features/authentication/data/authentication_repository.dart';

final socialSignInControllerProvider =
    StateNotifierProvider<SocialSignInController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return SocialSignInController(authRepository);
});

class SocialSignInController extends StateNotifier<AsyncValue<void>> {
  SocialSignInController(this._authenticationRepository)
      : super(const AsyncData(null));

  final AuthenticationRepository _authenticationRepository;

  void signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authenticationRepository.signInWithGoogle());
  }

  void signInWithFacebook() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authenticationRepository.signInWithFacebook());
  }
}
