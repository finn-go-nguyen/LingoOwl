import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../video_view_controller.dart';

class FullscreenSwitchButton extends ConsumerWidget {
  const FullscreenSwitchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullscreenModeOn = ref
        .watch(videoControllerProvider.select((value) => value.isFullscreen));
    return Transform.rotate(
      angle: pi / 4,
      child: IconButton(
        onPressed: isFullscreenModeOn
            ? ref
                .read(videoControllerProvider.notifier)
                .onExitFullscreenButtonPressed
            : ref
                .read(videoControllerProvider.notifier)
                .onFullscreenButtonPressed,
        icon: Icon(isFullscreenModeOn ? Icons.unfold_less : Icons.unfold_more),
      ),
    );
  }
}
