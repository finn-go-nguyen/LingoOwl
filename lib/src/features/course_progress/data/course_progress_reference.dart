import 'package:cloud_firestore/cloud_firestore.dart' hide Index;
import 'package:uuid/uuid.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/course_progress.dart';

class CourseProgressReference extends BaseCollectionReference<LCourseProgress> {
  CourseProgressReference(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.courseProgress).withConverter(
                fromFirestore: (snapshot, options) =>
                    LCourseProgress.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  Stream<LCourseProgress> watchCourseProgress(
    UserId userId,
    CourseId courseId,
  ) async* {
    final querySnapshotStream = ref
        .where('userId', isEqualTo: userId)
        .where('courseId', isEqualTo: courseId)
        .limit(1)
        .snapshots();
    await for (var snapshot in querySnapshotStream) {
      yield snapshot.docs.first.data();
    }
  }

  Future<void> markWatched(
    CourseProgressId id,
    Index lectureIndex,
  ) async {
    final courseProgress = await get(id);
    if (courseProgress?.watchedLectures.contains(lectureIndex) ?? false) return;

    final update = courseProgress!.copyWith(watchedLectures: [
      ...courseProgress.watchedLectures,
      lectureIndex,
    ]);
    set(id, update);
  }

  Future<void> markWatching(
    CourseProgressId id,
    Index lectureIndex,
  ) {
    return ref.doc(id).update({'lastWatchLecture': lectureIndex});
  }

  Future<void> updateLecturePosition(
    CourseProgressId id,
    Index lectureIndex,
    TimeStamp position,
  ) {
    return ref.doc(id).update({'videoPosition': position});
  }

  Future<void> createInitProgress(UserId userId, CourseId courseId) {
    final id = const Uuid().v4();
    final init = LCourseProgress(
      id: id,
      courseId: courseId,
      userId: userId,
    );
    return set(id, init);
  }
}
