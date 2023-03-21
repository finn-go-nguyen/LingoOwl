import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enums/question_type.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class LQuestion with _$LQuestion {
  const factory LQuestion({
    required String content,
    required QuestionType type,
    required List<String> choices,
    required List<String> answers,
    String? explanation,
  }) = _LQuestion;

  factory LQuestion.fromJson(Map<String, Object?> json) =>
      _$LQuestionFromJson(json);
}
