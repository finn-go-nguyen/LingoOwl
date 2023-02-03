import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../domain_manager.dart';
import '../../../authentication/data/authentication_repository.dart';
import '../../model/mutable_wishlist.dart';

final addToWishlistControllerProvider = StateNotifierProvider.autoDispose<
    AddToWishlistController, AsyncValue<bool>>((ref) {
  return AddToWishlistController(ref);
});

/// course is added or removed => state = AsyncData(true)
class AddToWishlistController extends StateNotifier<AsyncValue<bool>> {
  AddToWishlistController(this._ref) : super(const AsyncData(false));

  final AutoDisposeRef _ref;

  void toggleWishlist(CourseId courseId, {required bool isAddToList}) async {
    state = const AsyncLoading();

    final uid = _ref.watch(uidProvider)!;

    final wishlistRepository =
        _ref.watch(DomainManager.instance.wishlistRepositoryProvider);

    final asyncResult = await AsyncValue.guard(() async {
      final wishlist = await wishlistRepository.fetchWishlist(uid);
      final update = isAddToList
          ? wishlist.addItem(courseId)
          : wishlist.removeItem(courseId);
      return wishlistRepository.setWishlist(uid, update);
    });

    if (asyncResult.hasError) {
      state = asyncResult as AsyncError<bool>;
      return;
    }

    state = const AsyncData(true);
  }
}
