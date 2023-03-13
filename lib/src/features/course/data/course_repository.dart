import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../model/course.dart';

final coursesProvider = FutureProvider<List<LCourse>>(
  (ref) {
    final courseRepository =
        ref.read(DomainManager.instance.courseRepositoryProvider);
    return courseRepository.fetch();
  },
);

final courseProvider = FutureProvider.family<LCourse, String>((ref, id) {
  final courseRepository =
      ref.read(DomainManager.instance.courseRepositoryProvider);
  return courseRepository.fetchById(id);
});

final courseNameProvider = Provider.family<String, CourseId>((ref, courseId) {
  final course = ref.watch(courseProvider(courseId)).value;
  return course?.name ?? '';
});

abstract class CourseRepository {
  Future<List<LCourse>> fetch({int limit = 10, LCourse? course});
  Future<LCourse> fetchById(String id);
  Future<List<LCourse>> fetchByIds(List<String> ids);
}
