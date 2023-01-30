import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_manager.dart';
import '../model/app_user.dart';

final userFutureProvider =
    FutureProvider.family<LAppUser, String>((ref, uid) async {
  final userRepository =
      ref.watch(DomainManager.instance.userRepositoryProvider);
  return userRepository.get(uid);
});

/// Stream auto close when no longer needed.
/// [See document](https://pub.dev/documentation/riverpod/latest/riverpod/StreamProvider-class.html)
final userStreamProvider =
    StreamProvider.family.autoDispose<LAppUser, String>((ref, uid) {
  final userRepository =
      ref.watch(DomainManager.instance.userRepositoryProvider);
  return userRepository.getSnapshot(uid);
});

abstract class UserRepository {
  Future<bool> hasDocument(String uid);

  /// [LAppUser] is always getable because we set user every time user sign up
  Future<LAppUser> get(String uid);
  Stream<LAppUser> getSnapshot(String uid);
  Future<void> set(LAppUser user);
  Future<void> delete(LAppUser user);
  Future<void> updateAvatarUrl(String uid, String url);
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
  Stream<LAppUser> getSnapshot(String uid) async* {
    final documentSnapshotStream =
        _firestore.collection(_userCollection).doc(uid).snapshots();
    await for (var snapshot in documentSnapshotStream) {
      yield LAppUser.fromJson(snapshot.data()!);
    }
  }

  @override
  Future<void> set(LAppUser user) {
    return _firestore
        .collection(_userCollection)
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  Future<void> updateAvatarUrl(String uid, String url) =>
      _firestore.collection(_userCollection).doc(uid).update({'photoUrl': url});
}
