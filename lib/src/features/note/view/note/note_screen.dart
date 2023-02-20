import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../widgets/common/app_bar.dart';
import 'note_card.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

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
                  title: 'Notes',
                  leading: CloseButton(),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: UiParameters.screenPadding,
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return const NoteCard();
                    },
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
