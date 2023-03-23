import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../question/question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class LQuiz with _$LQuiz {
  const factory LQuiz({
    required QuizId id,
    required List<LQuestion> questions,
  }) = _LQuiz;

  factory LQuiz.fromJson(Map<String, Object?> json) => _$LQuizFromJson(json);
}
