// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LLecture _$$_LLectureFromJson(Map<String, dynamic> json) => _$_LLecture(
      index: json['index'] as int,
      name: json['name'] as String,
      type: $enumDecode(_$LectureTypeEnumMap, json['type']),
      seconds: json['seconds'] as int? ?? 0,
      videoId: json['videoId'] as String?,
      quizId: json['quizId'] as String?,
    );

Map<String, dynamic> _$$_LLectureToJson(_$_LLecture instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'type': _$LectureTypeEnumMap[instance.type]!,
      'seconds': instance.seconds,
      'videoId': instance.videoId,
      'quizId': instance.quizId,
    };

const _$LectureTypeEnumMap = {
  LectureType.video: 'video',
  LectureType.article: 'article',
  LectureType.quiz: 'quiz',
};
