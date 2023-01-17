// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LAuthUser _$$_LAuthUserFromJson(Map<String, dynamic> json) => _$_LAuthUser(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$_LAuthUserToJson(_$_LAuthUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
    };
