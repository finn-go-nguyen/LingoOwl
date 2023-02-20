import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/app_parameters/ui_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/dialog/alert_dialog.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    super.key,
    required this.onSaveButtonPressed,
    required this.position,
  });

  final void Function(String content) onSaveButtonPressed;
  final Duration position;

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      autofocus: true,
      controller: _controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
        border: InputBorder.none,
        hintText: 'At first, there was nothing...',
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );

    return WillPopScope(
      onWillPop: () async {
        final result = await showAlertDialog(
          context: LCoordinator.context,
          title: 'Please confirm',
          defaultActionText: 'Discard',
          cancelActionText: 'Cancel',
          content: 'Are you sure you want to discard your changes?',
          onConfirmPressed: LCoordinator.onBack,
        );
        return result ?? false;
      },
      child: Theme(
        // * Get theme which is defined at app.dart, not previous parent
        data: Theme.of(LCoordinator.context),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: UiParameters.screenPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(child: textField),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => showAlertDialog(
                        context: LCoordinator.context,
                        title: 'Please confirm',
                        defaultActionText: 'Discard',
                        cancelActionText: 'Cancel',
                        content:
                            'Are you sure you want to discard your changes?',
                        onConfirmPressed: LCoordinator.onBack,
                      ),
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    Text('Note at ${TextHelpers().toTimeLabel(
                      widget.position.inSeconds,
                      showHour:
                          widget.position.inSeconds > Duration.secondsPerHour,
                    )}'),
                    Gaps.w12,
                    FilledButton(
                      onPressed: () =>
                          widget.onSaveButtonPressed(_controller.text),
                      child: const Text('Save'),
                    ),
                  ],
                ),
                Gaps.h12,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
