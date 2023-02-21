import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../course/model/course.dart';
import '../../../lecture/model/lecture/lecture.dart';
import '../../model/note.dart';
import 'note_card.dart';

class NoteListView extends ConsumerWidget {
  const NoteListView({
    super.key,
    this.controller,
    required this.notes,
    required this.lectures,
    required this.course,
  });

  final ScrollController? controller;
  final List<LNote> notes;
  final List<LLecture> lectures;
  final LCourse course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (notes.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      controller: controller,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        final lecture = lectures.firstWhere(
          (element) => element.index == note.lectureIndex,
        );
        return NoteCard(
          note: note,
          course: course,
          lecture: lecture,
        );
      },
    );
  }
}
