import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../model/note.dart';
import 'note_card.dart';

class NoteListView extends ConsumerWidget {
  const NoteListView({
    super.key,
    this.controller,
    required this.notes,
    required this.seekTo,
  });

  final ScrollController? controller;
  final List<LNote> notes;
  final void Function(Index lectureIndex, Duration position)? seekTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (notes.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      controller: controller,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return NoteCard(
          note: note,
          seekTo: seekTo,
        );
      },
    );
  }
}
