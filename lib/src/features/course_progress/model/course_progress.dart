import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'course_progress.freezed.dart';
part 'course_progress.g.dart';

@freezed
class LCourseProgress with _$LCourseProgress {
  const LCourseProgress._();
  const factory LCourseProgress({
    required CourseProgressId id,
    required CourseId courseId,
    required UserId userId,

    /// Map<LectureIndex, IsLectureWatched>
    @Default(<Index>[]) List<Index> watchedLectures,
    Index? lastWatchLecture,
    @Default(0) TimeStamp videoPosition,
  }) = _LCourseProgress;

  factory LCourseProgress.fromJson(Map<String, Object?> json) =>
      _$LCourseProgressFromJson(json);

  int get watchedLectureCount => watchedLectures.length;
}
