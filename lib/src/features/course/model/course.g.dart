// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LCourse _$$_LCourseFromJson(Map<String, dynamic> json) => _$_LCourse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      instructorName: json['instructorName'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: json['ratingCount'] as int,
      price: (json['price'] as num).toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      category: json['category'] as String,
      youWillLearn: (json['youWillLearn'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_LCourseToJson(_$_LCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'instructorName': instance.instructorName,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'category': instance.category,
      'youWillLearn': instance.youWillLearn,
    };
