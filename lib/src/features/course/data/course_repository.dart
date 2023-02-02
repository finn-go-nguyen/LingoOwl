import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/mocks/courses.dart';
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

abstract class CourseRepository {
  Future<List<LCourse>> fetch({int limit = 10, LCourse? course});
  Future<LCourse> fetchById(String id);
  Future<List<LCourse>> fetchByIds(Iterable<String> ids);
}

class MockCourseRepository implements CourseRepository {
  @override
  Future<List<LCourse>> fetch({int limit = 10, LCourse? course}) async {
    await Future.delayed(const Duration(seconds: 4));
    return courses;
  }

  @override
  Future<LCourse> fetchById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return courses.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<LCourse>> fetchByIds(Iterable<String> ids) async {
    await Future.delayed(const Duration(seconds: 1));
    return courses.where((element) => ids.contains(element.id)).toList();
  }
}
