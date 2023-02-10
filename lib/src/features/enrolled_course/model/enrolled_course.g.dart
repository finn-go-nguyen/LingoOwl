// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EnrolledCourse _$$_EnrolledCourseFromJson(Map<String, dynamic> json) =>
    _$_EnrolledCourse(
      uid: json['uid'] as String,
      courseId: json['courseId'] as String,
      timeStamp: json['timeStamp'] as int,
      status:
          $enumDecodeNullable(_$EnrolledCourseStatusEnumMap, json['status']) ??
              EnrolledCourseStatus.all,
    );

Map<String, dynamic> _$$_EnrolledCourseToJson(_$_EnrolledCourse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'courseId': instance.courseId,
      'timeStamp': instance.timeStamp,
      'status': _$EnrolledCourseStatusEnumMap[instance.status]!,
    };

const _$EnrolledCourseStatusEnumMap = {
  EnrolledCourseStatus.all: 'all',
  EnrolledCourseStatus.favorited: 'favorited',
  EnrolledCourseStatus.archived: 'archived',
};
