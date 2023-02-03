import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../domain_manager.dart';
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

class FirestoreWishlistRepository implements WishlistRepository {
  FirestoreWishlistRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<LWishList> fetchWishlist(String uid) async {
    final docSnapshot =
        await _firestore.collection(CollectionName.wishlist).doc(uid).get();
    if (docSnapshot.exists) {
      return LWishList.fromJson(docSnapshot.data()!);
    }
    return const LWishList();
  }

  @override
  Future<void> setWishlist(String uid, LWishList cart) {
    return _firestore
        .collection(CollectionName.wishlist)
        .doc(uid)
        .set(cart.toJson());
  }

  @override
  Stream<LWishList> watchWishlist(String uid) async* {
    final docRef = _firestore
        .collection(CollectionName.wishlist)
        .withConverter<LWishList>(
          fromFirestore: (snapshot, options) =>
              LWishList.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(uid);
    await for (var doc in docRef.snapshots()) {
      yield doc.data() ?? const LWishList();
    }
  }
}
