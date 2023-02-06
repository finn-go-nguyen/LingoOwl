import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/wishlist.dart';

final wishlistProvider = StreamProvider.autoDispose<LWishList>((ref) async* {
  final uid = ref.watch(uidProvider);

  if (uid == null) yield const LWishList.empty();

  final wishlistRepository =
      ref.watch(DomainManager.instance.wishlistRepositoryProvider);
  yield* wishlistRepository.watchWishlist(uid!);
});

final isAddedToWishlistProvider =
    Provider.autoDispose.family<bool, String>((ref, courseId) {
  return ref.watch(wishlistProvider).maybeMap(
        data: (wishlist) => wishlist.value.courses.containsKey(courseId),
        orElse: () => false,
      );
});

abstract class WishlistRepository {
  Future<LWishList> fetchWishlist(String uid);
  Stream<LWishList> watchWishlist(String uid);
  Future<void> setWishlist(String uid, LWishList cart);
}

class FirestoreWishlistRepository extends BaseCollectionReference<LWishList>
    implements WishlistRepository {
  FirestoreWishlistRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.wishlist).withConverter(
                fromFirestore: (snapshot, options) =>
                    LWishList.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<LWishList> fetchWishlist(String uid) async {
    final result = await get(uid);
    return result ?? const LWishList();
  }

  @override
  Future<void> setWishlist(String uid, LWishList cart) {
    return set(uid, cart);
  }

  @override
  Stream<LWishList> watchWishlist(String uid) {
    return snapshots(uid);
  }
}
