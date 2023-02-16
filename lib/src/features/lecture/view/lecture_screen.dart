import 'package:flutter/material.dart';

import '../../../constants/mocks/videos.dart';
import '../../../widgets/common/common.dart';
import '../../video/view/video_view.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      body: Column(
        children: const [
          VideoView(videoUrl: kVideoUrl),
        ],
      ),
    );
  }
}
