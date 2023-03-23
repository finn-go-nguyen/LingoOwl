import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/question/question.dart';

import '../model/quiz/quiz.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const QuizState._();
  const factory QuizState({
    LQuiz? quiz,
    String? selected,
    @Default(<String>{}) Set<String> checkedAnswers,
    @Default(0) int currentQuestionIndex,
    @Default(AsyncLoading()) AsyncValue<void> status,
    @Default(false) bool hasCorrectAnswer,
  }) = _QuizState;

  bool get isLastQuestion => quiz?.questions.length == currentQuestionIndex + 1;
  LQuestion get currentQuestion => quiz!.questions[currentQuestionIndex];
  bool? checkIsCorrect(String value) {
    if (!checkedAnswers.contains(value)) return null;

    return currentQuestion.answers.contains(value);
  }

  bool enable(String value) {
    return (!hasCorrectAnswer && !checkedAnswers.contains(value)) ||
        currentQuestion.answers.contains(value);
  }
}
