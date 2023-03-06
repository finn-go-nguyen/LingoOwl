// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LNote _$$_LNoteFromJson(Map<String, dynamic> json) => _$_LNote(
      id: json['id'] as String,
      userId: json['userId'] as String,
      courseId: json['courseId'] as String,
      lectureIndex: json['lectureIndex'] as int,
      sectionIndex: json['sectionIndex'] as int,
      atSeconds: json['atSeconds'] as int,
      content: json['content'] as String,
      timeStamp: json['timeStamp'] as int,
    );

Map<String, dynamic> _$$_LNoteToJson(_$_LNote instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'courseId': instance.courseId,
      'lectureIndex': instance.lectureIndex,
      'sectionIndex': instance.sectionIndex,
      'atSeconds': instance.atSeconds,
      'content': instance.content,
      'timeStamp': instance.timeStamp,
    };
