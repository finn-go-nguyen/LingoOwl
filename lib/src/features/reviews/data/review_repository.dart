import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/review/review.dart';

abstract class ReviewRepository {
  Future<LReview?> fetchReview(CourseId courseId, UserId userId);
  Future<void> addReview(LReview review);
  Future<List<LReview>> fetchReviews(CourseId courseId,
      {int limit = 5, ReviewId? reviewId});
}

class FirestoreReviewRepository extends BaseCollectionReference<LReview>
    implements ReviewRepository {
  FirestoreReviewRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.review).withConverter(
                fromFirestore: (snapshot, options) =>
                    LReview.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<LReview?> fetchReview(CourseId courseId, UserId userId) async {
    final querySnapshot = await ref
        .where('courseId', isEqualTo: courseId)
        .where('userId', isEqualTo: userId)
        .get();
    if (querySnapshot.docs.isEmpty) return null;

    return querySnapshot.docs.first.data();
  }

  @override
  Future<void> addReview(LReview review) {
    return set(review.id, review);
  }

  @override
  Future<List<LReview>> fetchReviews(CourseId courseId,
      {int limit = 5, ReviewId? reviewId}) async {
    late QuerySnapshot<LReview> querySnapshot;
    final query = ref.where('courseId', isEqualTo: courseId).orderBy(
          'timeStamp',
          descending: true,
        );

    if (reviewId != null) {
      final documentSnapshot = await ref.doc(reviewId).get();
      querySnapshot =
          await query.startAfterDocument(documentSnapshot).limit(limit).get();
    } else {
      querySnapshot = await query.limit(limit).get();
    }

    if (querySnapshot.docs.isEmpty) return const <LReview>[];

    return querySnapshot.docs.map((e) => e.data()).toList();
  }
}
