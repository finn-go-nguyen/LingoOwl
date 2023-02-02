import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../constants/firestore/collection_name.dart';
import '../../model/cart.dart';

abstract class RemoteCartRepository {
  Future<LCart> fetchCart(String uid);
  Stream<LCart> watchCart(String uid);
  Future<void> setCart(String uid, LCart cart);
}

class FirestoreCartRepository implements RemoteCartRepository {
  FirestoreCartRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<LCart> fetchCart(String uid) async {
    final docSnapshot =
        await _firestore.collection(CollectionName.cart).doc(uid).get();
    if (docSnapshot.exists) {
      return LCart.fromJson(docSnapshot.data()!);
    }
    return const LCart();
  }

  @override
  Future<void> setCart(String uid, LCart cart) {
    return _firestore
        .collection(CollectionName.cart)
        .doc(uid)
        .set(cart.toJson());
  }

  @override
  Stream<LCart> watchCart(String uid) async* {
    final docRef = _firestore
        .collection(CollectionName.cart)
        .withConverter<LCart>(
          fromFirestore: (snapshot, options) =>
              LCart.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(uid);
    await for (var doc in docRef.snapshots()) {
      yield doc.data() ?? const LCart();
    }
  }
}
