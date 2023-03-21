import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/quiz/quiz.dart';

class QuizReference extends BaseCollectionReference<LQuiz> {
  QuizReference(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.quiz).withConverter(
                fromFirestore: (snapshot, options) =>
                    LQuiz.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
