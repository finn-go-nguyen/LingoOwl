import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/note.dart';

class NoteReference extends BaseCollectionReference<LNote> {
  NoteReference()
      : super(
          FirebaseFirestore.instance
              .collection(CollectionName.note)
              .withConverter(
                fromFirestore: (snapshot, _) =>
                    LNote.fromJson(snapshot.data()!),
                toFirestore: (value, _) => value.toJson(),
              ),
        );
}
