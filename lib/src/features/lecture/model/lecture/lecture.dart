import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enums/lecture_type.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../section/section.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';

@freezed
class LLecture with _$LLecture {
  const LLecture._();
  const factory LLecture({
    required Index index,
    required String name,
    required LectureType type,
    @Default(0) int seconds,
    VideoId? videoId,
    QuizId? quizId,
  }) = _LLecture;

  factory LLecture.fromJson(Map<String, Object?> json) =>
      _$LLectureFromJson(json);

  int getSectionIndex(List<LSection> sections) {
    final section = sections.firstWhere((element) => element.hasLecture(index));
    return section.index;
  }
}
