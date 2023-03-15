import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/app_user.dart';

final userFutureProvider =
    FutureProvider.family<LAppUser, String>((ref, uid) async {
  final userRepository =
      ref.watch(DomainManager.instance.userRepositoryProvider);
  return userRepository.getUser(uid);
});

/// Stream auto close when no longer needed.
/// [See document](https://pub.dev/documentation/riverpod/latest/riverpod/StreamProvider-class.html)
final userStreamProvider =
    StreamProvider.family.autoDispose<LAppUser, String>((ref, uid) {
  final userRepository =
      ref.watch(DomainManager.instance.userRepositoryProvider);
  return userRepository.getUserSnapshot(uid);
});

abstract class UserRepository {
  Future<bool> isExist(String uid);

  /// [LAppUser] is always getable because we set user every time user sign up
  Future<LAppUser> getUser(String uid);
  Stream<LAppUser> getUserSnapshot(String uid);
  Future<void> setUser(LAppUser user);
  Future<void> deleteUser(String uid);
  Future<void> updateUserAvatarUrl(String uid, String url);
}

class FirestoreUserRepository extends BaseCollectionReference<LAppUser>
    implements UserRepository {
  FirestoreUserRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.user).withConverter(
                fromFirestore: (snapshot, options) =>
                    LAppUser.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<bool> isExist(String uid) async {
    return exist(uid);
  }

  @override
  Future<void> deleteUser(String uid) {
    return delete(uid);
  }

  @override
  Future<LAppUser> getUser(String uid) async {
    final user = await get(uid);
    return user!;
  }

  @override
  Stream<LAppUser> getUserSnapshot(String uid) async* {
    await for (var user in snapshots(uid)) {
      yield user!;
    }
  }

  @override
  Future<void> setUser(LAppUser user) {
    return set(user.id, user);
  }

  @override
  Future<void> updateUserAvatarUrl(String uid, String url) =>
      ref.doc(uid).update({'photoUrl': url});
}
