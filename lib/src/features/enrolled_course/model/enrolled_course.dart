import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums/enrolled_course_status.dart';
import '../../../constants/type_defs/type_defs.dart';

part 'enrolled_course.freezed.dart';
part 'enrolled_course.g.dart';

@freezed
class EnrolledCourse with _$EnrolledCourse {
  const factory EnrolledCourse({
    /// Different from `CourseId`
    required UserId uid,
    required CourseId courseId,
    required TimeStamp timeStamp,
    @Default(EnrolledCourseStatus.all) EnrolledCourseStatus status,
  }) = _EnrolledCourse;

  factory EnrolledCourse.fromJson(Map<String, Object?> json) =>
      _$EnrolledCourseFromJson(json);
}
