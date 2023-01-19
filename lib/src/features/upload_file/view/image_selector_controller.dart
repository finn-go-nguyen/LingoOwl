import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/logger.dart';
import '../../authentication/data/authentication_repository.dart';
import '../data/storage_repository.dart';
import 'image_selector_state.dart';

final imageSelectorControllerProvider =
    StateNotifierProvider<ImageSelectorController, ImageSelectorState>((ref) {
  return ImageSelectorController(ref);
});

class ImageSelectorController extends StateNotifier<ImageSelectorState> {
  ImageSelectorController(this._ref) : super(const ImageSelectorState());

  final Ref _ref;

  StreamSubscription? _subscription;

  void onUploadImagePressed() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
    if (pickedFile == null) return;

    final storageRepository = _ref.read(storageRepositoryProvider);

    state = const ImageSelectorState(
      isUploadStarted: true,
      status: AsyncLoading(),
    );
    final uid = _ref.read(uidProvider)!;

    _subscription = storageRepository
        .uploadAvatar(uid: uid, filePath: pickedFile.path)
        .listen(
      (event) async {
        state = state.copyWith(progress: event);
        if (event == 1.0) {
          final photoUrlValue = await AsyncValue.guard(
              () => storageRepository.getAvatarDownloadUrl(uid));

          state = state.copyWith(
            status: photoUrlValue,
            isUploadCompleted: true,
            downloadUrl: photoUrlValue.value,
          );

          _subscription?.cancel();
          return;
        }
      },
      onDone: () => log.i('onDone called'),
      onError: (error) => state = state.copyWith(
        status: AsyncError(error, StackTrace.current),
      ),
    );
  }

  void onSavePressed() {
    state = const ImageSelectorState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
