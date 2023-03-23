// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LCourseProgress _$$_LCourseProgressFromJson(Map<String, dynamic> json) =>
    _$_LCourseProgress(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      userId: json['userId'] as String,
      watchedLectures: (json['watchedLectures'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <Index>[],
      lastWatchLecture: json['lastWatchLecture'] as int?,
      videoPosition: json['videoPosition'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LCourseProgressToJson(_$_LCourseProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'userId': instance.userId,
      'watchedLectures': instance.watchedLectures,
      'lastWatchLecture': instance.lastWatchLecture,
      'videoPosition': instance.videoPosition,
    };
