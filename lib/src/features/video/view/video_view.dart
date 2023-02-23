import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../themes/colors.dart';
import '../../../widgets/state/loading/video/video_loading.dart';
import 'video_view_controller.dart';
import 'widgets/video_bottom_controller_widget.dart';
import 'widgets/video_mid_controller_widget.dart';
import 'widgets/video_top_controller_widget.dart';

class VideoView extends StatelessWidget {
  const VideoView({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    return url == null
        ? const VideoLoading()
        : LVideoPlayer(
            videoUrl: url!,
            key: ValueKey(url),
          );
  }
}

class LVideoPlayer extends ConsumerStatefulWidget {
  const LVideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  ConsumerState<LVideoPlayer> createState() => _LVideoPlayerState();
}

class _LVideoPlayerState extends ConsumerState<LVideoPlayer> {
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

          _controller.addListener(() => _listener(ref));
        },
      );
  }

  @override
  void dispose() {
    _controller.removeListener(() => _listener(ref));
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = ref
        .watch(videoControllerProvider.select((value) => value.isInitialized));
    final isFullscreenModeOn = ref
        .watch(videoControllerProvider.select((value) => value.isFullscreen));
    final size = MediaQuery.of(context).size;
    return isInitialized
        ? Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox.fromSize(
                size: isFullscreenModeOn
                    ? size
                    : Size(
                        size.width,
                        size.width / UiParameters.videoAspectRatio,
                      ),
                child: AspectRatio(
                  aspectRatio: UiParameters.videoAspectRatio,
                  child: ColoredBox(
                    color: LColors.videoPlayerBackground,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        GestureDetector(
                          onTap: ref
                              .read(videoControllerProvider.notifier)
                              .showController,
                          onDoubleTapDown: (details) {
                            final box =
                                context.findRenderObject()! as RenderBox;
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
                          child: AspectRatio(
                            aspectRatio: UiParameters.videoAspectRatio,
                            child: VideoPlayer(_controller),
                          ),
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
                  ),
                ),
              ),
            ),
          )
        : const VideoLoading();
  }

  void _listener(WidgetRef ref) {
    ref.read(videoControllerProvider.notifier).updateOnPlaying(
          position: _controller.value.position,
        );
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
                VideoBottomControllerWidget(
                  controller: controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
