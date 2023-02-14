import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../constants/firestore/collection_name.dart';
import '../../../../utils/base_collection_reference.dart';
import '../../model/cart.dart';

abstract class RemoteCartRepository {
  Future<LCart> fetchCart(String uid);
  Stream<LCart> watchCart(String uid);
  Future<void> setCart(String uid, LCart cart);
}

class FirestoreCartRepository extends BaseCollectionReference<LCart>
    implements RemoteCartRepository {
  FirestoreCartRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.cart).withConverter(
                fromFirestore: (snapshot, options) =>
                    LCart.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<LCart> fetchCart(String uid) async {
    final cart = await get(uid);
    return cart ?? const LCart();
  }

  @override
  Future<void> setCart(String uid, LCart cart) {
    return set(uid, cart);
  }

  @override
  Stream<LCart> watchCart(String uid) {
    return snapshots(uid);
  }
}
