import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/text_helpers.dart';
import '../../../course/model/course.dart';
import '../../../lecture/model/lecture/lecture.dart';
import '../../model/note.dart';
import '../add_note/add_note_bottom_sheet.dart';
import 'note_screen_controller.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.course,
    required this.lecture,
    this.seekTo,
  });

  final LNote note;
  final LCourse course;
  final LLecture lecture;
  final void Function(Index lectureIndex, Duration position)? seekTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseId = note.courseId;
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, child) {
                final textHelper = ref.watch(textHelpersProvider);
                return Text(textHelper.toTimeLabel(note.atSeconds));
              }),
            ),
          ),
          Gaps.h8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.description_outlined,
              ),
              Gaps.w12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lecture.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Gaps.h8,
                    Text(
                      course.id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PopupMenuButton(
                itemBuilder: (_) => <PopupMenuEntry>[
                  PopupMenuItem(
                    onTap: () async {
                      final controller = ref.watch(
                          noteScreenControllerProvider(courseId).notifier);
                      // * Must have to show bottom sheet
                      // * https://stackoverflow.com/a/69939955/16037103
                      Future.delayed(
                        Duration.zero,
                        () => showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          useSafeArea: true,
                          isDismissible: false,
                          builder: (_) {
                            return AddNoteBottomSheet(
                              onSaveButtonPressed: (content) {
                                controller.onSaveButtonPressed(note, content);
                                LCoordinator.onBack();
                              },
                              content: note.content,
                              position: Duration(seconds: note.atSeconds),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('Edit'),
                  ),
                  PopupMenuItem(
                    onTap: () => ref
                        .read(noteScreenControllerProvider(courseId).notifier)
                        .onDeleteButtonPressed(note.id),
                    child: const Text('Delete'),
                  )
                ],
              ),
            ],
          ),
          if (note.content.isNotEmpty)
            Column(
              children: [
                Gaps.h20,
                Text(
                  note.content,
                ),
              ],
            ),
          Gaps.h12,
        ],
      ),
    );
  }
}
