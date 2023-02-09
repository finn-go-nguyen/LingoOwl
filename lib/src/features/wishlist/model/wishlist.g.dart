// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LWishList _$$_LWishListFromJson(Map<String, dynamic> json) => _$_LWishList(
      courses: (json['courses'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const <CourseId, TimeStamp>{},
    );

Map<String, dynamic> _$$_LWishListToJson(_$_LWishList instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };
