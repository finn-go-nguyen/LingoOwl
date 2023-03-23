import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../lecture/data/lecture_repository.dart';
import '../model/course_progress.dart';

final courseProgressStreamProvider = StreamProvider.autoDispose
    .family<LCourseProgress, CourseId>((ref, courseId) {
  ref.keepAlive();
  final uid = ref.watch(uidProvider)!;
  final courseProgressRepository =
      ref.watch(DomainManager.instance.courseProgressRepositoryProvider);
  return courseProgressRepository.watchCourseProgress(uid, courseId);
});

final progressPercentageProvider =
    FutureProvider.autoDispose.family<double, CourseId>((ref, courseId) async {
  ref.keepAlive();
  final record = await Future.wait([
    ref.watch(lectureCountProvider(courseId).future),
    ref.watch(courseProgressStreamProvider(courseId).future),
  ]);
  final count = record[0] as int;
  final courseProgress = record[1] as LCourseProgress;
  return courseProgress.watchedLectureCount * 1.0 / count;
});

abstract class CourseProgressRepository {
  Stream<LCourseProgress> watchCourseProgress(UserId userId, CourseId courseId);
  Future<void> markWatched(CourseProgressId id, Index lectureIndex);
  Future<void> markWatching(CourseProgressId id, Index lectureIndex);
  Future<void> updateLecturePosition(
    CourseProgressId id,
    Index lectureIndex,
    TimeStamp position,
  );
  Future<void> createInitProgress(UserId userId, CourseId courseId);
}
