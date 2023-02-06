import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/app_parameters/app_parameters.dart';
import '../../../utils/text_helpers.dart';
import '../../../widgets/common/network_image.dart';
import 'image_selector_controller.dart';

class ImageSelector extends ConsumerWidget {
  const ImageSelector({
    super.key,
    required this.onSubmitted,
  });

  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.h16,
        Consumer(builder: (context, ref, child) {
          final photoUrl = ref.watch(imageSelectorControllerProvider
              .select((value) => value.downloadUrl));
          return ImagePreviewer(photoUrl: photoUrl);
        }),
        Gaps.h16,
        Text(
          'Add / Change Image',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Gaps.h16,
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(imageSelectorControllerProvider);
              return Expanded(
                child: ProgressBar(
                  progress: state.progress,
                  showProgress: state.isUploadStarted,
                ),
              );
            }),
            SizedBox(
              height: UiParameters.imageSelectorUploadButtonHeight,
              child: Consumer(builder: (context, ref, child) {
                final status = ref.watch(imageSelectorControllerProvider
                    .select((value) => value.status));
                return TextButton.icon(
                  onPressed: status.isLoading
                      ? null
                      : ref
                          .read(imageSelectorControllerProvider.notifier)
                          .onUploadImagePressed,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload image'),
                );
              }),
            ),
          ],
        ),
        Gaps.h16,
        Align(
          alignment: Alignment.centerRight,
          child: Consumer(builder: (context, ref, child) {
            final photoUrl = ref.watch(imageSelectorControllerProvider
                .select((value) => value.downloadUrl));
            return ElevatedButton(
              onPressed: photoUrl == null
                  ? null
                  : () {
                      onSubmitted(photoUrl);
                      ref
                          .read(imageSelectorControllerProvider.notifier)
                          .onSavePressed();
                    },
              child: const Text('Save'),
            );
          }),
        )
      ],
    );
  }
}

class ImagePreviewer extends StatelessWidget {
  const ImagePreviewer({
    super.key,
    required this.photoUrl,
  });

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Image preview',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Gaps.h16,
        Container(
          height: UiParameters.imageSelectorHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: UiParameters.borderRadius,
          ),
          child: Consumer(builder: (context, ref, child) {
            return photoUrl != null
                ? Padding(
                    padding: UiParameters.imagePadding,
                    child: ClipRRect(
                      borderRadius: UiParameters.borderRadius,
                      child: LNetworkImage(
                        photoUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Center(
                    child: SizedBox.square(
                      dimension: UiParameters.imageSelectorIconDimension,
                      child: Image.asset(
                        Assets.icons.accountCircle.path,
                        fit: BoxFit.contain,
                        color: Colors.black54,
                      ),
                    ),
                  );
          }),
        ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
    required this.showProgress,
  });

  final double progress;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UiParameters.imageSelectorUploadButtonHeight,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: UiParameters.borderRadius,
      ),
      child: showProgress
          ? Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: UiParameters.borderRadius,
                  child: LinearProgressIndicator(value: progress),
                ),
                Center(
                  child: Text(
                    TextHelpers.toProgress(progress),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            )
          : Padding(
              padding: UiParameters.imageSelectorUploadButtonPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'No file selected',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
    );
  }
}
