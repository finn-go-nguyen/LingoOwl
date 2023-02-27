import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../router/coordinator.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../lecture/view/lecture_screen_controller.dart';
import 'add_note_bottom_sheet.dart';
import 'add_note_controller.dart';

class AddNoteButton extends ConsumerWidget {
  const AddNoteButton({
    super.key,
    required this.onAddButtonPressed,
    required this.position,
  });

  final VoidCallback onAddButtonPressed;
  final Duration position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addNoteControllerProvider, (previous, next) {
      next.showSuccess(context, content: 'Note added!');
      next.showError(context);
    });
    final controller = ref.watch(addNoteControllerProvider.notifier);
    return IconButton(
      onPressed: () async {
        final courseId = ref.read(lectureScreenCurrentCourseIdProvider);
        final index = ref.read(lectureScreenCurrentIndexProvider);
        onAddButtonPressed();
        await showModalBottomSheet(
          useSafeArea: true,
          context: LCoordinator.context,
          isDismissible: false,
          builder: (_) {
            return ProviderScope(
              parent: ProviderScope.containerOf(
                LCoordinator.context,
                listen: false,
              ),
              child: AddNoteBottomSheet(
                onSaveButtonPressed: (content) {
                  controller.onSaveButtonPressed(
                    courseId: courseId,
                    lectureIndex: index,
                    atSeconds: position.inSeconds,
                    content: content,
                    onNoteSaved: LCoordinator.onBack,
                  );
                },
                position: position,
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.edit_note),
    );
  }
}
