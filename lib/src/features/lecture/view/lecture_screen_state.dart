import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/lecture/lecture.dart';
import '../model/section/section.dart';

part 'lecture_screen_state.freezed.dart';

@freezed
class LectureScreenState with _$LectureScreenState {
  const factory LectureScreenState({
    required List<LSection> sections,
    required LLecture selected,
  }) = _LectureScreenState;
}
