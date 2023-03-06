import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/note.dart';
import 'note_reference.dart';
import 'note_repository.dart';

final notesStreamProvider =
    StreamProvider.autoDispose.family<List<LNote>, CourseId>((ref, courseId) {
  final noteRepository =
      ref.watch(DomainManager.instance.noteRepositoryProvider);
  final uid = ref.watch(uidProvider);
  if (uid == null) return const Stream.empty();

  return noteRepository.watchNotes(uid, courseId);
});

class FirestoreNoteRepository implements NoteRepository {
  FirestoreNoteRepository();

  final _noteRef = NoteReference();

  @override
  Future<void> addNote(LNote note) {
    return _noteRef.set(note.id, note);
  }

  @override
  Future<void> deleteNote(NoteId id) {
    return _noteRef.ref.doc(id).delete();
  }

  @override
  Future<void> editNote(LNote note) {
    return _noteRef.set(note.id, note);
  }

  @override
  Future<List<LNote>> fetchByCourse(UserId userId, CourseId courseId) async {
    final querySnapshot = await _noteRef.ref
        .where('courseId', isEqualTo: courseId)
        .orderBy('timeStamp', descending: true)
        .get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Stream<List<LNote>> watchNotes(UserId userId, CourseId courseId) {
    final querySnapshot = _noteRef.ref
        .where('courseId', isEqualTo: courseId)
        .where('userId', isEqualTo: userId)
        .orderBy('timeStamp', descending: true)
        .snapshots();
    return querySnapshot.map((event) {
      if (event.docs.isEmpty) return const <LNote>[];

      return event.docs.map((e) => e.data()).toList();
    });
  }
}
