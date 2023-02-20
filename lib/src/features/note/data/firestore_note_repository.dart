import '../../../constants/type_defs/type_defs.dart';
import '../model/note.dart';
import 'note_reference.dart';
import 'note_repository.dart';

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
}
