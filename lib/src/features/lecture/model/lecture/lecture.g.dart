// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LLecture _$$_LLectureFromJson(Map<String, dynamic> json) => _$_LLecture(
      index: json['index'] as int,
      name: json['name'] as String,
      type: $enumDecode(_$LectureTypeEnumMap, json['type']),
      videoId: json['videoId'] as String?,
      seconds: json['seconds'] as int,
    );

Map<String, dynamic> _$$_LLectureToJson(_$_LLecture instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'type': _$LectureTypeEnumMap[instance.type]!,
      'videoId': instance.videoId,
      'seconds': instance.seconds,
    };

const _$LectureTypeEnumMap = {
  LectureType.video: 'video',
  LectureType.article: 'article',
};
