import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/app_user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirestoreUserRepository(FirebaseFirestore.instance);
});

final userFutureProvider =
    FutureProvider.family<LAppUser, String>((ref, uid) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.get(uid);
});

abstract class UserRepository {
  Future<bool> hasDocument(String uid);

  /// [LAppUser] is always getable because we set user every time user sign up
  Future<LAppUser> get(String uid);
  Future<void> set(LAppUser user);
  Future<void> delete(LAppUser user);
}

class FirestoreUserRepository implements UserRepository {
  const FirestoreUserRepository(this._firestore);

  static const _userCollection = 'users';

  final FirebaseFirestore _firestore;

  @override
  Future<bool> hasDocument(String uid) async {
    final documentSnapshot =
        await _firestore.collection('users').doc(uid).get();
    return documentSnapshot.exists;
  }

  @override
  Future<void> delete(LAppUser user) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<LAppUser> get(String uid) async {
    final documentSnapshot =
        await _firestore.collection(_userCollection).doc(uid).get();
    return LAppUser.fromJson(documentSnapshot.data()!);
  }

  @override
  Future<void> set(LAppUser user) {
    return _firestore
        .collection(_userCollection)
        .doc(user.id)
        .set(user.toJson());
  }
}
