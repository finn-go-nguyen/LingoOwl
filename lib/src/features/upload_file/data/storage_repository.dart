import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return FirebaseStorageRepository(FirebaseStorage.instance);
});

abstract class StorageRepository {
  Stream<double> uploadAvatar({
    required String uid,
    required String filePath,
    void Function(Future<String> urlDownload)? onUploadCompleted,
  });
  Future<String> getAvatarDownloadUrl(String uid);
}

class FirebaseStorageRepository implements StorageRepository {
  const FirebaseStorageRepository(this._storage);

  final FirebaseStorage _storage;

  @override
  Stream<double> uploadAvatar({
    required String uid,
    required String filePath,
    void Function(Future<String> urlDownload)? onUploadCompleted,
  }) async* {
    final file = File(filePath);
    final metadata = SettableMetadata(contentType: 'image/jpeg');
    final avatarRef = _storage.ref().child('avatars/$uid.jpg');
    final uploadTask = avatarRef.putFile(file, metadata);

    uploadTask.whenComplete(() {
      onUploadCompleted?.call(avatarRef.getDownloadURL());
    });

    await for (var snapshot in uploadTask.snapshotEvents) {
      double progress = snapshot.bytesTransferred / snapshot.totalBytes;
      yield progress;
    }
  }

  @override
  Future<String> getAvatarDownloadUrl(String uid) async {
    final avatarRef = _storage.ref().child('avatars/$uid.jpg');
    return avatarRef.getDownloadURL();
  }
}
