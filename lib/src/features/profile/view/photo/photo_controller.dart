import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/data/authentication_repository.dart';
import '../../data/user_repository.dart';

final photoControllerProvider =
    StateNotifierProvider<PhotoController, AsyncValue<void>>((ref) {
  return PhotoController(ref);
});

class PhotoController extends StateNotifier<AsyncValue<void>> {
  PhotoController(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  void onSavePressed(String photoUrl) async {
    state = const AsyncLoading();
    final uid = _ref.read(uidProvider)!;
    final userRepository = _ref.read(userRepositoryProvider);
    state = await AsyncValue.guard(
        () => userRepository.updateAvatarUrl(uid, photoUrl));
  }
}
