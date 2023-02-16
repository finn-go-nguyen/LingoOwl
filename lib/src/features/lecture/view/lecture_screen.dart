import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/async_value_ui.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../video/data/video_repository.dart';
import '../../video/view/video_view.dart';
import 'lecture_more_view.dart';
import 'lecture_screen_controller.dart';
import 'lecture_selection_view.dart';
import 'widgets/lecture_tab_bar.dart';

class LectureScreen extends ConsumerWidget {
  const LectureScreen({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(lectureScreenControllerProvider(courseId),
        (previous, next) {
      next.showError(context);
    });
    final state = ref.watch(lectureScreenControllerProvider(courseId));

    final header = SliverToBoxAdapter(
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
    );
    return LScaffold(
      body: state.when(
        loading: LoadingState.new,
        error: (_, __) => const ErrorState(),
        data: (data) => LScaffold(
          body: Column(
            children: [
              if (data.selected.type.isVideo)
                Consumer(
                  builder: (context, ref, child) {
                    final video =
                        ref.watch(videoProvider(data.selected.videoId!));
                    return video.when(
                      loading: () => VideoView(
                        url: null,
                        urlKey: UniqueKey(),
                      ),
                      error: (_, __) => const ErrorState(),
                      data: (data) => VideoView(
                        url: data.url,
                        urlKey: UniqueKey(),
                      ),
                    );
                  },
                ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      header,
                      const LectureTabBar(),
                    ],
                    body: TabBarView(
                      children: [
                        LectureSelectionView(
                          courseId: courseId,
                          lectures: data.lectures,
                          sections: data.sections,
                          selectedIndex: data.selected.index,
                        ),
                        const LectureMoreView(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
