// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LQuiz _$$_LQuizFromJson(Map<String, dynamic> json) => _$_LQuiz(
      id: json['id'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => LQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LQuizToJson(_$_LQuiz instance) => <String, dynamic>{
      'id': instance.id,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };
