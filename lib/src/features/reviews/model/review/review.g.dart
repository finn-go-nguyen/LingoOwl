// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LReview _$$_LReviewFromJson(Map<String, dynamic> json) => _$_LReview(
      reviewId: json['reviewId'] as String,
      courseId: json['courseId'] as String,
      reviewerName: json['reviewerName'] as String,
      star: json['star'] as int,
      timeStamp: json['timeStamp'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_LReviewToJson(_$_LReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'courseId': instance.courseId,
      'reviewerName': instance.reviewerName,
      'star': instance.star,
      'timeStamp': instance.timeStamp,
      'content': instance.content,
    };
