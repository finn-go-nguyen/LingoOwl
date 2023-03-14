import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/type_defs/type_defs.dart';
import '../../domain_manager.dart';
import '../../features/course/data/course_repository.dart';

final courseShareButtonProvider = StateNotifierProvider.autoDispose<
    CourseShareButtonController, AsyncValue<void>>((ref) {
  return CourseShareButtonController(ref);
});

class CourseShareButtonController extends StateNotifier<AsyncValue<void>> {
  CourseShareButtonController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  void onShareButtonPressed(CourseId courseId) async {
    state = const AsyncLoading();
    final repo = ref.watch(DomainManager.instance.deepLinkRepositoryProvider);

    final shortLinkValue =
        await AsyncValue.guard(() => repo.getCourseLink(courseId));
    state = shortLinkValue;
    if (shortLinkValue.hasError) return;

    Share.share(
      'I saw this course on Owl Learning and thought of you.\n${shortLinkValue.value!}',
      subject: ref.read(courseNameProvider(courseId)),
    );
  }
}
