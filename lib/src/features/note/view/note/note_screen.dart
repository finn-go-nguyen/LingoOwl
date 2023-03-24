import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../widgets/common/app_bar.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../data/firestore_note_repository.dart';
import 'note_list_view.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({
    super.key,
    required this.courseId,
    required this.seekTo,
  });

  final CourseId courseId;
  final void Function(Index lectureIndex, Duration position)? seekTo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scrollHeight =
        size.height - size.width / UiParameters.videoAspectRatio;
    final relativeHeight = scrollHeight / size.height;

    return Material(
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        initialChildSize: relativeHeight,
        maxChildSize: 1,
        minChildSize: relativeHeight,
        builder: (context, scrollController) {
          return ColoredBox(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                const LAppBar(
                  title: Text('Notes'),
                  leading: CloseButton(),
                ),
                Expanded(
                  child: Padding(
                    padding: UiParameters.screenPadding,
                    child: Consumer(builder: (context, ref, child) {
                      final noteValue =
                          ref.watch(notesStreamProvider(courseId));
                      return noteValue.when(
                        loading: LoadingState.new,
                        error: (_, __) => const ErrorState(),
                        data: (notes) => NoteListView(
                          controller: scrollController,
                          notes: notes,
                          seekTo: seekTo,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
