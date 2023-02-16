import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/mocks/videos.dart';
import '../../../widgets/common/common.dart';
import '../../video/view/video_view.dart';
import 'lecture_more_view.dart';
import 'lecture_selection_view.dart';
import 'lecture_tab_bar.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      body: Column(
        children: [
          const VideoView(videoUrl: kVideoUrl),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: UiParameters.screenPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gaps.h16,
                          Text(
                            'Android Jetpack Compose: The Comprehensive Bootcamp',
                            maxLines: 4,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Paulo Dichone | Software Engineer, AWS Cloud',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const LectureTabBar(),
                ],
                body: const TabBarView(
                  children: [
                    LectureSelectionView(),
                    LectureMoreView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
