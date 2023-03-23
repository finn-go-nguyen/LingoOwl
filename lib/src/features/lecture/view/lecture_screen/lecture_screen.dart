import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../article/model/article.dart';
import '../../../article/view/article_view.dart';
import '../../../course/data/course_repository.dart';
import '../../../note/view/add_note/add_note_controller.dart';
import '../../../quiz/view/quiz_view.dart';
import '../../../video/data/video_repository.dart';
import '../../../video/view/video_view.dart';
import '../lecture_more_view/lecture_more_view.dart';
import '../lecture_selection_view/lecture_selection_view.dart';
import '../widgets/lecture_tab_bar.dart';
import 'lecture_screen_controller.dart';

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
    ref.listen(addNoteControllerProvider, (previous, next) {
      next.showSuccess(context, content: 'Note added!');
      next.showError(context);
    });

    final state = ref.watch(lectureScreenControllerProvider(courseId));

    return LScaffold(
      body: state.when(
        loading: LoadingState.new,
        error: (_, __) => const Center(child: Text('No lectures')),
        data: (data) {
          final lectureIndex = data.selected.index;
          final sectionIndex = data.selected.getSectionIndex(data.sections);
          return ProviderScope(
            overrides: [
              lectureScreenCurrentCourseIdProvider.overrideWithValue(courseId),
              lectureScreenCurrentLectureIndexProvider
                  .overrideWithValue(lectureIndex),
              lectureScreenCurrentSectionIndexProvider
                  .overrideWithValue(sectionIndex),
            ],
            child: LScaffold(
              body: Column(
                children: [
                  if (data.selected.type.isVideo)
                    _buildVideoView(data.selected.videoId!, courseId),
                  if (data.selected.type.isArticle) _buildArticleView(),
                  if (data.selected.type.isQuiz)
                    _buildQuiz(
                      data.selected.quizId!,
                      courseId,
                      data.selected.name,
                    ),
                  Visibility(
                    visible: data.selected.type.isVideo,
                    child: Expanded(
                      child: DefaultTabController(
                        length: 2,
                        child: NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) =>
                              [
                            _buildHeader(),
                            const LectureTabBar(),
                          ],
                          body: TabBarView(
                            children: [
                              LectureSelectionView(
                                courseId: courseId,
                                sections: data.sections,
                                selectedIndex: data.selected.index,
                              ),
                              LectureMoreView(
                                courseId: courseId,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Consumer(builder: (context, ref, child) {
        final courseValue = ref.watch(courseProvider(courseId));
        return courseValue.when(
          loading: LoadingState.small,
          error: (_, __) => const SizedBox.shrink(),
          data: (course) {
            return Padding(
              padding: UiParameters.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.h16,
                  Text(
                    course.name,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Gaps.h8,
                  Text(
                    course.instructorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

Widget _buildVideoView(VideoId videoId, CourseId courseId) {
  return Consumer(
    builder: (context, ref, child) {
      final video = ref.watch(videoProvider(videoId));
      return video.when(
        loading: LoadingState.small,
        error: (_, __) => const ErrorState(),
        data: (data) => VideoView(
          key: ObjectKey(data),
          video: data,
          onVideoEnd: ref
              .read(lectureScreenControllerProvider(courseId).notifier)
              .onLectureComplete,
        ),
      );
    },
  );
}

Widget _buildArticleView() {
  return const Expanded(
    child: ArticleView(
      article: LArticle(id: '', htmlCode: ''),
    ),
  );
}

Widget _buildQuiz(
  QuizId quizId,
  CourseId courseId,
  String title,
) {
  return Expanded(
    child: Consumer(builder: (context, ref, child) {
      return QuizView(
        onQuizComplete: ref
            .read(lectureScreenControllerProvider(courseId).notifier)
            .onLectureComplete,
        title: title,
        quizId: quizId,
      );
    }),
  );
}
