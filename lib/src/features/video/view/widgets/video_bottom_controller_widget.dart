import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../video_view_controller.dart';
import 'fullscreen_switch_button.dart';
import 'video_progress_bar.dart';

class VideoBottomControllerWidget extends ConsumerWidget {
  const VideoBottomControllerWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final textHelpers = ref.watch(textHelpersProvider);
      final position =
          ref.watch(videoControllerProvider.select((state) => state.position));
      final duration =
          ref.watch(videoControllerProvider.select((state) => state.duration));
      return Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_note),
          ),
          Text(textHelpers.toTimeLabel(
            position.inSeconds,
            showHour: duration.inSeconds > Duration.secondsPerHour,
          )),
          Gaps.w12,
          Expanded(
            child: VideoProgressBar(
              controller: controller,
            ),
          ),
          Gaps.w12,
          Text(textHelpers.toTimeLabel(
            duration.inSeconds,
            showHour: duration.inSeconds > Duration.secondsPerHour,
          )),
          const FullscreenSwitchButton(),
        ],
      );
    });
  }
}
