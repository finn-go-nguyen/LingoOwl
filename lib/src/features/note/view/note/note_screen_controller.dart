import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../domain_manager.dart';
import '../../../course/data/course_repository.dart';
import '../../../course/model/course.dart';
import '../../../lecture/data/lecture_repository.dart';
import '../../../lecture/model/lecture/lecture.dart';
import '../../data/firestore_note_repository.dart';
import '../../model/note.dart';
import 'note_screen_state.dart';

final noteScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<NoteScreenController, NoteScreenState, CourseId>((ref, courseId) {
  return NoteScreenController(courseId, ref);
});

class NoteScreenController extends StateNotifier<NoteScreenState> {
  NoteScreenController(
    this.courseId,
    this.ref,
  ) : super(const NoteScreenState(status: AsyncLoading())) {
    _init();
  }

  final CourseId courseId;
  final Ref ref;

  void _init() async {
    final asyncValue = await AsyncValue.guard(
      () => Future.wait([
        ref.read(lecturesProvider(courseId).future),
        ref.read(notesProvider(courseId).future),
        ref.read(courseProvider(courseId).future),
      ]),
    );
    state = state.copyWith(status: asyncValue);
    if (asyncValue.hasError) {
      return;
    }
    final result = asyncValue.value!;
    state = state.copyWith(
      lectures: result[0] as List<LLecture>,
      notes: result[1] as List<LNote>,
      course: result[2] as LCourse,
    );
  }

  void onSaveButtonPressed(LNote note, String content) async {
    final noteRepo = ref.read(DomainManager.instance.noteRepositoryProvider);
    final asyncValue = await AsyncValue.guard(
        () => noteRepo.editNote(note.copyWith(content: content)));
    state = state.copyWith(status: asyncValue);
    if (asyncValue.hasError) return;
    ref.invalidateSelf();
  }

  void onDeleteButtonPressed(NoteId id) async {
    final noteRepo = ref.read(DomainManager.instance.noteRepositoryProvider);
    final asyncValue = await AsyncValue.guard(() => noteRepo.deleteNote(id));
    state = state.copyWith(status: asyncValue);
    if (asyncValue.hasError) return;
    ref.invalidateSelf();
  }
}
