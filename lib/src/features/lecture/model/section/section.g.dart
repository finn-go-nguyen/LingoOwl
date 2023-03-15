// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LSection _$$_LSectionFromJson(Map<String, dynamic> json) => _$_LSection(
      index: json['index'] as int,
      name: json['name'] as String,
      lectures: (json['lectures'] as List<dynamic>)
          .map((e) => LLecture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LSectionToJson(_$_LSection instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'lectures': instance.lectures,
    };
