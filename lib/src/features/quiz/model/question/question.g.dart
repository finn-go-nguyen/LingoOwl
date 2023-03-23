// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LQuestion _$$_LQuestionFromJson(Map<String, dynamic> json) => _$_LQuestion(
      content: json['content'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$$_LQuestionToJson(_$_LQuestion instance) =>
    <String, dynamic>{
      'content': instance.content,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'choices': instance.choices,
      'answers': instance.answers,
      'explanation': instance.explanation,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multipleChoice',
};
