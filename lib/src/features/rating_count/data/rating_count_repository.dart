import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/star_count/star_count.dart';

// * Not use autoDispose because we use this in many places
final starCountProvider =
    FutureProvider.family<LStarCount, CourseId>((ref, courseId) {
  final ratingCountRepository =
      ref.watch(DomainManager.instance.ratingCountRepositoryProvider);
  return ratingCountRepository.getRatingCount(courseId);
});

abstract class RatingCountRepository {
  Future<LStarCount> getRatingCount(CourseId courseId);
}

class FirestoreRatingCountRepository extends BaseCollectionReference<LStarCount>
    implements RatingCountRepository {
  FirestoreRatingCountRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.ratingCount).withConverter(
                fromFirestore: (snapshot, options) =>
                    LStarCount.fromDocument(snapshot.data()!),
                toFirestore: (value, options) => value.toDocument(),
              ),
        );

  @override
  Future<LStarCount> getRatingCount(CourseId courseId) async {
    final starCount = await get(courseId);
    return starCount ?? const LStarCount();
  }
}
