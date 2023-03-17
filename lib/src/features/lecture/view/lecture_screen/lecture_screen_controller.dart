import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../course_progress/data/course_progress_repository.dart';
import '../../../course_progress/model/course_progress.dart';
import '../../application/lecture_service.dart';
import '../../model/lecture/lecture.dart';
import '../../model/section/section.dart';
import 'lecture_screen_state.dart';

final lectureScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<LectureScreenController, AsyncValue<LectureScreenState>, CourseId>(
        (ref, courseId) {
  final lectureService = ref.watch(lectureServiceProvider);
  return LectureScreenController(lectureService, courseId);
});

// * Override every time enter lecture screen
final lectureScreenCurrentCourseIdProvider = Provider<CourseId>((ref) {
  throw UnimplementedError();
});

// * Override every time enter lecture screen
final lectureScreenCurrentLectureIndexProvider = Provider<Index>((ref) {
  throw UnimplementedError();
});

// * Override every time enter lecture screen
final lectureScreenCurrentSectionIndexProvider = Provider<Index>((ref) {
  throw UnimplementedError();
});

final watchCheckProvider = Provider.autoDispose.family<bool, Index>(
  (ref, lectureIndex) {
    final courseId = ref.watch(lectureScreenCurrentCourseIdProvider);
    final courseProgress =
        ref.watch(courseProgressStreamProvider(courseId)).value;
    return courseProgress?.watchedLectures.contains(lectureIndex) ?? false;
  },
  dependencies: [lectureScreenCurrentCourseIdProvider],
);

class LectureScreenController
    extends StateNotifier<AsyncValue<LectureScreenState>> {
  LectureScreenController(
    this._lectureService,
    this.courseId,
  ) : super(const AsyncLoading()) {
    _init(courseId);
  }

  final CourseId courseId;
  final LectureService _lectureService;

  void _init(CourseId courseId) async {
    final asyncValue = await AsyncValue.guard(
      () => Future.wait(
        [
          _lectureService.getSections(courseId),
          _lectureService.getProgress(courseId),
        ],
      ),
    );
    state = asyncValue.when(
      data: (data) {
        final sections = data[0] as List<LSection>;
        final progress = data[1] as LCourseProgress;
        final selectedIndex = progress.lastWatchLecture;
        LLecture? selectedLecture;
        for (var section in sections) {
          if (selectedIndex == null) break;

          if (!section.hasLecture(selectedIndex)) continue;

          selectedLecture = section.lectures
              .firstWhere((element) => element.index == selectedIndex);
          break;
        }
        return AsyncData(
          LectureScreenState(
            sections: sections,
            selected: selectedLecture ?? sections.first.lectures.first,
            courseProgress: progress,
          ),
        );
      },
      error: AsyncError.new,
      loading: AsyncLoading.new,
    );
  }

  void onLectureTileTapped(LLecture lecture) async {
    state.whenData((value) async {
      state = AsyncData(
        value.copyWith(
          selected: lecture,
        ),
      );

      if (value.selected.type.isArticle) {
        final asyncValue = await AsyncValue.guard(
          () => _lectureService.onLectureComplete(
              value.courseProgress.id, value.selected.index),
        );
        if (asyncValue is AsyncError) {
          state = asyncValue as AsyncError<LectureScreenState>;
        }
      }

      final asyncValue = await AsyncValue.guard(
        () => _lectureService.onLectureChanged(
          value.courseProgress.id,
          lecture.index,
        ),
      );

      if (asyncValue is AsyncError) {
        state = asyncValue as AsyncError<LectureScreenState>;
      }
    });
  }

  void onVideoEnd() {
    state.whenData((value) {
      _lectureService.onLectureComplete(
          value.courseProgress.id, value.selected.index);
      if (value.isLastLecture) return;

      state = AsyncData(value.copyWith(
        selected: value.nextLecture,
      ));
    });
  }
}
