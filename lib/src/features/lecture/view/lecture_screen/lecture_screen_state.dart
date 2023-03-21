import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../course_progress/model/course_progress.dart';
import '../../model/lecture/lecture.dart';
import '../../model/section/section.dart';

part 'lecture_screen_state.freezed.dart';

@freezed
class LectureScreenState with _$LectureScreenState {
  const LectureScreenState._();
  const factory LectureScreenState({
    required List<LSection> sections,
    required LLecture selected,
    required LCourseProgress courseProgress,
  }) = _LectureScreenState;

  List<LLecture> get lectures {
    final result = <LLecture>[];
    for (var section in sections) {
      result.addAll(section.lectures);
    }
    return result;
  }

  List<LSection> get sortedSection =>
      List.from(sections)..sort((a, b) => a.index.compareTo(b.index));
  bool get isLastLecture => selected == sortedSection.last.sortedLectures.last;
  LLecture get nextLecture {
    return lectures
        .firstWhere((element) => element.index == selected.index + 1);
  }
}
