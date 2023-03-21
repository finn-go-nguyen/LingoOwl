import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../data/quiz_repository.dart';

import '../../../constants/enums/question_type.dart';
import 'quiz_state.dart';

final quizControllerProvider = StateNotifierProvider.autoDispose
    .family<QuizController, QuizState, QuizId>((ref, quizId) {
  final quizRepository =
      ref.watch(DomainManager.instance.quizRepositoryProvider);
  return QuizController(quizId, quizRepository);
});

class QuizController extends StateNotifier<QuizState> {
  QuizController(QuizId quizId, this._repository) : super(const QuizState()) {
    _init(quizId);
  }

  final QuizRepository _repository;

  void _init(QuizId quizId) async {
    final asyncValue =
        await AsyncValue.guard(() => _repository.fetchQuiz(quizId));
    if (asyncValue is AsyncError) {
      state = state.copyWith(status: asyncValue);
      return;
    }
    state = state.copyWith(
      quiz: asyncValue.value,
      status: asyncValue,
    );
  }

  void onAnswerChanged(String? selected) {
    state = state.copyWith(
      selected: selected,
    );
  }

  void setCurrentQuestionIndex(int index) {
    state = state.copyWith(currentQuestionIndex: index);
  }

  void onBottomButtonPressed({
    required void Function()? onNextButtonPressed,
    required void Function() onQuizCompleted,
  }) {
    if (state.hasCorrectAnswer) {
      if (state.isLastQuestion) {
        onQuizCompleted();
        return;
      }

      onNextButtonPressed?.call();
      state = state.copyWith(
        checkedAnswers: {},
        selected: null,
        hasCorrectAnswer: false,
      );
      return;
    }

    if (_isCorrectAnswer) {
      state = state.copyWith(
        checkedAnswers: {
          ...state.checkedAnswers,
          state.selected!,
        },
        hasCorrectAnswer: true,
      );
      return;
    }
    state = state.copyWith(
      checkedAnswers: {
        ...state.checkedAnswers,
        state.selected!,
      },
      selected: null,
    );
  }

  bool get _isCorrectAnswer {
    final selected = state.selected;
    switch (state.currentQuestion.type) {
      case QuestionType.multipleChoice:
        return state.quiz!.questions[state.currentQuestionIndex].answers
            .contains(selected);
    }
  }
}
