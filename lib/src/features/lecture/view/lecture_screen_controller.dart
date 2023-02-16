import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain_manager.dart';
import '../model/lecture/lecture.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../data/lecture_repository.dart';
import 'lecture_screen_state.dart';

final lectureScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<LectureScreenController, AsyncValue<LectureScreenState>, CourseId>(
        (ref, courseId) {
  final lectureRepository =
      ref.watch(DomainManager.instance.lectureRepositoryProvider);
  return LectureScreenController(courseId, lectureRepository);
});

class LectureScreenController
    extends StateNotifier<AsyncValue<LectureScreenState>> {
  LectureScreenController(
    CourseId courseId,
    this._lectureRepository,
  ) : super(const AsyncLoading()) {
    _init(courseId);
  }

  final LectureRepository _lectureRepository;

  void _init(CourseId courseId) async {
    final async =
        await AsyncValue.guard(() => _lectureRepository.getLecture(courseId));
    state = async.when(
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
