import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../course_progress/data/course_progress_repository.dart';
import '../../course_progress/model/course_progress.dart';
import '../model/section/section.dart';

final lectureServiceProvider = Provider.autoDispose<LectureService>((ref) {
  return LectureService(ref);
});

class LectureService {
  const LectureService(this._ref);

  final Ref _ref;

  Future<List<LSection>> getSections(CourseId courseId) {
    final lectureRepository =
        _ref.watch(DomainManager.instance.lectureRepositoryProvider);
    return lectureRepository.getSections(courseId);
  }

  Future<LCourseProgress> getProgress(CourseId courseId) {
    return _ref.read(courseProgressStreamProvider(courseId).future);
  }

  Future<void> onLectureComplete(
      CourseProgressId progressId, Index lectureIndex) {
    final courseProgressRepository =
        _ref.watch(DomainManager.instance.courseProgressRepositoryProvider);
    return courseProgressRepository.markWatched(progressId, lectureIndex);
  }

  Future<void> onLectureChanged(
      CourseProgressId progressId, Index lectureIndex) {
    final courseProgressRepository =
        _ref.read(DomainManager.instance.courseProgressRepositoryProvider);
    return courseProgressRepository.markWatching(progressId, lectureIndex);
  }
}
