import 'package:freezed_annotation/freezed_annotation.dart';

import '../../authentication/model/auth_user.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class LAppUser with _$LAppUser {
  const LAppUser._();
  const factory LAppUser({
    required String id,
    required String email,
    required String firstName,
    String? lastName,
    String? headline,
    String? website,
    String? photoUrl,
  }) = _LAppUser;

  factory LAppUser.fromJson(Map<String, dynamic> json) =>
      _$LAppUserFromJson(json);

  factory LAppUser.fromAuthUser(LAuthUser user) => LAppUser(
        id: user.id,
        email: user.email,
        firstName: user.displayName ?? user.id,
        photoUrl: user.photoURL,
      );
}
