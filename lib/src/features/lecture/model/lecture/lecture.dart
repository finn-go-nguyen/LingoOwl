import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enums/lecture_type.dart';
import '../../../../constants/type_defs/type_defs.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';

@freezed
class LLecture with _$LLecture {
  const factory LLecture({
    required Index index,
    required String name,
    required Index sectionIndex,
    required LectureType type,
    VideoId? videoId,
  }) = _LLecture;

  factory LLecture.fromJson(Map<String, Object?> json) =>
      _$LLectureFromJson(json);
}
