import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/course.dart';
import 'course_reference.dart';
import 'course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final _courseCollection = CourseReference(FirebaseFirestore.instance);

  @override
  Future<List<LCourse>> fetch({int limit = 10, LCourse? course}) {
    return _courseCollection.getAll();
  }

  @override
  Future<LCourse> fetchById(String id) async {
    final result = await _courseCollection.get(id);
    return result!;
  }

  @override
  Future<List<LCourse>> fetchByIds(List<String> ids) async {
    if (ids.isEmpty) return const <LCourse>[];

    final batches = <LCourse>[];

    List<List<String>> subList = [];
    for (var i = 0; i < ids.length; i += 10) {
      subList.add(
        ids.sublist(i, i + 10 > ids.length ? ids.length : i + 10),
      );
    }

    for (var sub in subList) {
      final query = await _courseCollection.ref.where('id', whereIn: sub).get();
      batches.addAll(query.docs.map((e) => e.data()));
    }

    return batches;
  }
}
