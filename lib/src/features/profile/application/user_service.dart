import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/data/authentication_repository.dart';
import '../../authentication/model/auth_user.dart';
import '../data/user_repository.dart';
import '../model/app_user.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return UserService(authRepository, userRepository);
});

class UserService {
  const UserService(
    this._authRepository,
    this._userRepository,
  );

  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final authUser = await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final update = authUser.copyWith(displayName: name);

      return _userRepository.set(LAppUser.fromAuthUser(update));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() =>
      _signInWithSocialAccount(_authRepository.signInWithGoogle);

  Future<void> signInWithFacebook() =>
      _signInWithSocialAccount(_authRepository.signInWithFacebook);

  Future<void> signInWithMicrosoft() =>
      _signInWithSocialAccount(_authRepository.signInWithMicrosoft);

  Future<void> _signInWithSocialAccount(
      Future<LAuthUser> Function() signIn) async {
    try {
      final authUser = await signIn();

      // * No need to add to firestore if already has document
      if (await _userRepository.hasDocument(authUser.id)) return;

      return _userRepository.set(LAppUser.fromAuthUser(authUser));
    } catch (e) {
      rethrow;
    }
  }
}
