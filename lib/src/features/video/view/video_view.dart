import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../themes/colors.dart';
import '../../../widgets/state/loading/loading.dart';
import 'video_view_controller.dart';
import 'widgets/video_bottom_controller_widget.dart';
import 'widgets/video_mid_controller_widget.dart';
import 'widgets/video_top_controller_widget.dart';

class VideoView extends ConsumerStatefulWidget {
  const VideoView({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  ConsumerState<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends ConsumerState<VideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then(
        (_) {
          ref
              .read(videoControllerProvider.notifier)
              .onInitComplete(_controller);

          // Update current time
          _controller.addListener(() {
            ref.read(videoControllerProvider.notifier).updateOnPlaying(
                  position: _controller.value.position,
                );
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = ref
        .watch(videoControllerProvider.select((state) => state.isInitialized));

    return isInitialized
        ? AspectRatio(
            aspectRatio: UiParameters.videoAspectRatio,
            child: Stack(
              children: [
                GestureDetector(
                  onTap:
                      ref.read(videoControllerProvider.notifier).showController,
                  onDoubleTapDown: (details) {
                    final box = context.findRenderObject()! as RenderBox;
                    if (details.localPosition.dx < box.size.width / 2) {
                      ref
                          .read(videoControllerProvider.notifier)
                          .onVideoBackward(_controller);
                    } else {
                      ref
                          .read(videoControllerProvider.notifier)
                          .onVideoForward(_controller);
                    }
                  },
                  child: VideoPlayer(_controller),
                ),
                Consumer(builder: (context, ref, child) {
                  final visible = ref.watch(videoControllerProvider
                      .select((state) => state.showController));
                  return Visibility(
                    visible: visible,
                    child: VideoControllerWidget(
                      controller: _controller,
                    ),
                  );
                }),
              ],
            ),
          )
        : const LoadingState();
  }
}

class VideoControllerWidget extends ConsumerWidget {
  const VideoControllerWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  Color get _color => Colors.white;
  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: _color,
        brightness: Brightness.light,
        primary: _color,
      );
  TextButtonThemeData get _textButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  IconThemeData get _iconThemeData => IconThemeData(
        color: _color,
      );
  TextStyle get _textStyle => TextStyle(color: _color);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: _colorScheme,
        textButtonTheme: _textButtonThemeData,
        iconTheme: _iconThemeData,
      ),
      child: DefaultTextStyle(
        style: _textStyle,
        child: ColoredBox(
          color: LColors.videoDimBackground,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: ref.read(videoControllerProvider.notifier).hideController,
            child: Column(
              children: [
                VideoTopControllerWidget(controller: controller),
                const Spacer(),
                VideoMidControllerWidget(controller: controller),
                const Spacer(),
                VideoBottomControllerWidget(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
