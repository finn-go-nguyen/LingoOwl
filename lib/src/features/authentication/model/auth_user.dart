import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class LAuthUser with _$LAuthUser {
  const LAuthUser._();
  const factory LAuthUser({
    required String id,
    String? email,
    String? photoURL,
  }) = _LAuthUser;

  factory LAuthUser.fromFirebaseUser(User user) {
    return LAuthUser(
      id: user.uid,
      email: user.email,
      photoURL: user.photoURL,
    );
  }

  factory LAuthUser.fromJson(Map<String, Object?> json) =>
      _$LAuthUserFromJson(json);
}
