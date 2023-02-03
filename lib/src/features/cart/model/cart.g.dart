// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LCart _$$_LCartFromJson(Map<String, dynamic> json) => _$_LCart(
      courses: (json['courses'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const <CourseId, TimeStamp>{},
    );

Map<String, dynamic> _$$_LCartToJson(_$_LCart instance) => <String, dynamic>{
      'courses': instance.courses,
    };
