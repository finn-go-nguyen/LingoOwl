// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LStarCount _$$_LStarCountFromJson(Map<String, dynamic> json) =>
    _$_LStarCount(
      stars: (json['stars'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                int.parse(k), LStar.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <int, LStar>{
            5: LStar.five(0),
            4: LStar.four(0),
            3: LStar.three(0),
            2: LStar.two(0),
            1: LStar.one(0)
          },
    );

Map<String, dynamic> _$$_LStarCountToJson(_$_LStarCount instance) =>
    <String, dynamic>{
      'stars': instance.stars.map((k, e) => MapEntry(k.toString(), e)),
    };
