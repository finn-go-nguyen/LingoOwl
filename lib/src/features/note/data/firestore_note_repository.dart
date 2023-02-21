import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/note.dart';
import 'note_reference.dart';
import 'note_repository.dart';

final notesProvider = FutureProvider.autoDispose
    .family<List<LNote>, CourseId>((ref, courseId) async {
  final noteRepository =
      ref.watch(DomainManager.instance.noteRepositoryProvider);
  final uid = ref.watch(uidProvider);
  if (uid == null) return const <LNote>[];
  return noteRepository.fetchByCourse(uid, courseId);
});

class FirestoreNoteRepository implements NoteRepository {
  FirestoreNoteRepository();

  final noteRef = NoteReference();

  @override
  Future<void> addNote(LNote note) {
    return noteRef.set(note.id, note);
  }

  @override
  Future<void> deleteNote(NoteId id) {
    return noteRef.ref.doc(id).delete();
  }

  @override
  Future<void> editNote(LNote note) {
    return noteRef.set(note.id, note);
  }

  @override
  Future<List<LNote>> fetchByCourse(UserId userId, CourseId courseId) async {
    final querySnapshot = await noteRef.ref
        .where('courseId', isEqualTo: courseId)
        .orderBy('timeStamp', descending: true)
        .get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }
}
