import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTopControllerWidget extends StatelessWidget {
  const VideoTopControllerWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.expand_more),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('1080P'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('CC'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('1.0X'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
