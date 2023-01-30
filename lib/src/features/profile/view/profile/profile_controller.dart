import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain_manager.dart';

import '../../data/user_repository.dart';
import '../../model/app_user.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<void>>((ref) {
  final userRepository =
      ref.watch(DomainManager.instance.userRepositoryProvider);
  return ProfileController(userRepository);
});

class ProfileController extends StateNotifier<AsyncValue<void>> {
  ProfileController(this._userRepository) : super(const AsyncData(null));

  final UserRepository _userRepository;

  void save(LAppUser user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _userRepository.set(user));
  }
}
