// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LAppUser _$$_LAppUserFromJson(Map<String, dynamic> json) => _$_LAppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      headline: json['headline'] as String?,
      website: json['website'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_LAppUserToJson(_$_LAppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'headline': instance.headline,
      'website': instance.website,
      'photoUrl': instance.photoUrl,
    };
