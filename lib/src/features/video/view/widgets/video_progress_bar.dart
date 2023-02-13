import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../themes/colors.dart';
import '../video_view_controller.dart';

class VideoProgressBar extends ConsumerWidget {
  const VideoProgressBar({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int position = controller.value.position.inMilliseconds;
    int duration = controller.value.duration.inMilliseconds;
    int maxBuffering = 0;
    for (final DurationRange range in controller.value.buffered) {
      final int end = range.end.inMilliseconds;
      if (end > maxBuffering) {
        maxBuffering = end;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: ProgressIndicator(
        hasBuffer: controller.value.buffered.isNotEmpty,
        bufferValue: maxBuffering / duration,
        relativePosition: position / duration,
      ),
      onHorizontalDragStart: (_) {
        ref
            .read(videoControllerProvider.notifier)
            .onHorizontalDragStart(controller);
      },
      onHorizontalDragUpdate: (details) {
        final relativePosition =
            _calculateRelativePosition(context, details.globalPosition);
        ref
            .read(videoControllerProvider.notifier)
            .onHorizontalDragUpdate(controller, relativePosition);
      },
      onHorizontalDragEnd: (_) {
        ref
            .read(videoControllerProvider.notifier)
            .onHorizontalDragEnd(controller);
      },
      onTapDown: (details) {
        final relativePosition =
            _calculateRelativePosition(context, details.globalPosition);
        ref
            .read(videoControllerProvider.notifier)
            .onTapDown(controller, relativePosition);
      },
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.hasBuffer,
    required this.bufferValue,
    required this.relativePosition,
  });

  final bool hasBuffer;
  final double? bufferValue;
  final double relativePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (hasBuffer)
          LinearProgressIndicator(
            value: bufferValue ?? 0.0,
            valueColor: const AlwaysStoppedAnimation<Color>(
                LColors.videoProgressBarBuffer),
            backgroundColor: LColors.videoProgressBarBackground,
          ),
        LinearProgressIndicator(
          value: relativePosition,
          // valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
          backgroundColor: LColors.videoProgressBarBackground,
        ),
      ],
    );
  }
}

double _calculateRelativePosition(
  BuildContext context,
  Offset globalPosition,
) {
  final RenderBox box = context.findRenderObject()! as RenderBox;
  final Offset tapPos = box.globalToLocal(globalPosition);
  return tapPos.dx / box.size.width;
}
