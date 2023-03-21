import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../model/quiz/quiz.dart';

final quizProvider = FutureProvider.family<LQuiz, QuizId>((ref, quizId) async {
  final quizRepository =
      ref.watch(DomainManager.instance.quizRepositoryProvider);
  return quizRepository.fetchQuiz(quizId);
});

abstract class QuizRepository {
  Future<void> addQuiz(LQuiz quiz);
  Future<LQuiz> fetchQuiz(QuizId quizId);
}
