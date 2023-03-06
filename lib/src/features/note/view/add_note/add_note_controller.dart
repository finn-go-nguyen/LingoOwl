import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../domain_manager.dart';
import '../../model/note.dart';

final addNoteControllerProvider =
    StateNotifierProvider<AddNoteController, AsyncValue<void>>((ref) {
  return AddNoteController(ref);
});

class AddNoteController extends StateNotifier<AsyncValue<void>> {
  AddNoteController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  void onSaveButtonPressed({
    required UserId userId,
    required int atSeconds,
    required String content,
    required CourseId courseId,
    required Index lectureIndex,
    required Index sectionIndex,
    required void Function() onNoteSaved,
  }) async {
    final noteRepository =
        ref.read(DomainManager.instance.noteRepositoryProvider);

    final note = LNote(
      id: const Uuid().v4(),
      userId: userId,
      courseId: courseId,
      lectureIndex: lectureIndex,
      sectionIndex: sectionIndex,
      atSeconds: atSeconds,
      content: content,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
    );
    state = await AsyncValue.guard(() => noteRepository.addNote(note));
    if (state.hasError) return;
    onNoteSaved();
  }
}
