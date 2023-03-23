import 'package:cloud_firestore/cloud_firestore.dart' hide Index;

import '../../../constants/type_defs/type_defs.dart';
import '../model/course_progress.dart';
import 'course_progress_reference.dart';
import 'course_progress_repository.dart';

class CourseProgressRepositoryImpl implements CourseProgressRepository {
  final collectionRef = CourseProgressReference(FirebaseFirestore.instance);

  @override
  Stream<LCourseProgress> watchCourseProgress(
    UserId userId,
    CourseId courseId,
  ) =>
      collectionRef.watchCourseProgress(userId, courseId);

  @override
  Future<void> markWatched(CourseProgressId id, Index lectureIndex) =>
      collectionRef.markWatched(id, lectureIndex);

  @override
  Future<void> markWatching(CourseProgressId id, Index lectureIndex) =>
      collectionRef.markWatching(id, lectureIndex);

  @override
  Future<void> updateLecturePosition(
          CourseProgressId id, Index lectureIndex, TimeStamp position) =>
      collectionRef.updateLecturePosition(id, lectureIndex, position);

  @override
  Future<void> createInitProgress(UserId userId, CourseId courseId) =>
      collectionRef.createInitProgress(userId, courseId);
}
