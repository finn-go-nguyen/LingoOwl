import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../lecture/lecture.dart';
import '../section/section.dart';

part 'lecture_wrapper.freezed.dart';
part 'lecture_wrapper.g.dart';

@freezed
class LLectureWrapper with _$LLectureWrapper {
  const factory LLectureWrapper({
    required CourseId courseId,
    required List<LLecture> lectures,
    required List<LSection> sections,
  }) = _LLectureWrapper;

  factory LLectureWrapper.fromJson(Map<String, Object?> json) =>
      _$LLectureWrapperFromJson(json);
}
