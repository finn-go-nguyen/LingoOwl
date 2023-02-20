import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class LNote with _$LNote {
  const LNote._();
  const factory LNote({
    required NoteId id,
    required CourseId courseId,
    required Index lectureIndex,
    required int atSeconds,
    required String content,
    required TimeStamp timeStamp,
  }) = _LNote;

  factory LNote.fromJson(Map<String, Object?> json) => _$LNoteFromJson(json);
}
