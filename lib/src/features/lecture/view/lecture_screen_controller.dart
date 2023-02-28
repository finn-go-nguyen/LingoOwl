import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../model/lecture/lecture.dart';
import 'lecture_screen_state.dart';

final lectureScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<LectureScreenController, AsyncValue<LectureScreenState>, CourseId>(
        (ref, courseId) {
  return LectureScreenController(ref, courseId);
});

// * Override every time enter lecture screen
final lectureScreenCurrentCourseIdProvider = Provider<CourseId>((ref) {
  throw UnimplementedError();
});

// * Override every time enter lecture screen
final lectureScreenCurrentIndexProvider = Provider<Index>((ref) {
  throw UnimplementedError();
});

class LectureScreenController
    extends StateNotifier<AsyncValue<LectureScreenState>> {
  LectureScreenController(
    this.ref,
    this.courseId,
  ) : super(const AsyncLoading()) {
    _init(courseId);
  }

  final Ref ref;
  final CourseId courseId;

  void _init(CourseId courseId) async {
    final lectureRepository =
        ref.watch(DomainManager.instance.lectureRepositoryProvider);
    final asyncValue =
        await AsyncValue.guard(() => lectureRepository.getLecture(courseId));
    state = asyncValue.when(
      data: (data) {
        final lectures = data.lectures;
        final selected = lectures.first;
        final sections = data.sections;
        return AsyncData(LectureScreenState(
          lectures: lectures,
          selected: selected,
          sections: sections,
        ));
      },
      error: AsyncError.new,
      loading: AsyncLoading.new,
    );
  }

  void onLectureTileTapped(LLecture lecture) {
    state.whenData(
        (value) => state = AsyncData(value.copyWith(selected: lecture)));
  }
}
