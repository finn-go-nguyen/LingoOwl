import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../upload_file/view/image_selector.dart';
import 'photo_controller.dart';

class PhotoView extends ConsumerWidget {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(photoControllerProvider, (previous, next) {
      next.showError(context);
      next.showLoadingDialog(context, previous);
      next.showSuccess(context, content: 'Avatar update successfully!');
    });
    return Column(
      children: [
        Table(
          border: UiParameters.tableBorder,
          children: [
            TableRow(
              children: [
                Padding(
                  padding: UiParameters.rowContentPadding,
                  child: Column(
                    children: [
                      Text(
                        'Photo',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Text(
                          'Add a nice photo of yourself for your profile.'),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: UiParameters.rowContentPadding,
                  child: ImageSelector(
                    onSubmitted: ref
                        .read(photoControllerProvider.notifier)
                        .onSavePressed,
                  ),
                )
              ],
            )
          ],
        ),
        Gaps.h32,
      ],
    );
  }
}
