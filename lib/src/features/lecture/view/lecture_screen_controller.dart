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
final lectureScreenCurrentLectureIndexProvider = Provider<Index>((ref) {
  throw UnimplementedError();
});

// * Override every time enter lecture screen
final lectureScreenCurrentSectionIndexProvider = Provider<Index>((ref) {
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
        await AsyncValue.guard(() => lectureRepository.getSections(courseId));
    state = asyncValue.when(
      data: (data) {
        final sections = data;
        return AsyncData(
          LectureScreenState(
            sections: sections,
            selected: sections.first.lectures.first,
          ),
        );
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
