import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/ui_parameters.dart';

class VideoLoading extends StatelessWidget {
  const VideoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: UiParameters.videoAspectRatio,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
