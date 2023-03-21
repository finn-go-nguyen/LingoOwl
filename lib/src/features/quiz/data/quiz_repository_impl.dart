import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../model/quiz/quiz.dart';
import 'quiz_reference.dart';
import 'quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final _quizReference = QuizReference(FirebaseFirestore.instance);
  @override
  Future<LQuiz> fetchQuiz(QuizId quizId) async {
    final quiz = await _quizReference.get(quizId);
    return quiz!;
  }

  @override
  Future<void> addQuiz(LQuiz quiz) {
    return _quizReference.set(quiz.id, quiz);
  }
}
