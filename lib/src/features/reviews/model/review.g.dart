// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LReview _$$_LReviewFromJson(Map<String, dynamic> json) => _$_LReview(
      id: json['id'] as String,
      userId: json['userId'] as String,
      courseId: json['courseId'] as String,
      rating: json['rating'] as int,
      timeStamp: json['timeStamp'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_LReviewToJson(_$_LReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'courseId': instance.courseId,
      'rating': instance.rating,
      'timeStamp': instance.timeStamp,
      'content': instance.content,
    };
