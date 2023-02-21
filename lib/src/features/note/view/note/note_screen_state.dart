import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../course/model/course.dart';
import '../../../lecture/model/lecture/lecture.dart';
import '../../model/note.dart';

part 'note_screen_state.freezed.dart';

@freezed
class NoteScreenState with _$NoteScreenState {
  const factory NoteScreenState({
    required AsyncValue<void> status,
    List<LLecture>? lectures,
    List<LNote>? notes,
    LCourse? course,
  }) = _NoteScreenState;
}
