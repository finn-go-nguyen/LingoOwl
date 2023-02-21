import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/lecture/lecture.dart';
import '../model/wrapper/lecture_wrapper.dart';

final lectureWrapperProvider =
    FutureProvider.family<LLectureWrapper, CourseId>((ref, courseId) async {
  final lectureRepository =
      ref.watch(DomainManager.instance.lectureRepositoryProvider);

  return lectureRepository.getLecture(courseId);
});

final lecturesProvider =
    FutureProvider.family<List<LLecture>, CourseId>((ref, courseId) async {
  final lectureWrapper =
      await ref.watch(lectureWrapperProvider(courseId).future);
  return lectureWrapper.lectures;
});

abstract class LectureRepository {
  Future<LLectureWrapper> getLecture(CourseId courseId);
}

class FirestoreLectureRepository
    extends BaseCollectionReference<LLectureWrapper>
    implements LectureRepository {
  FirestoreLectureRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.lecture).withConverter(
                fromFirestore: (snapshot, options) =>
                    LLectureWrapper.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  @override
  Future<LLectureWrapper> getLecture(CourseId courseId) async {
    final result = await get(courseId);
    return result!;
  }
}
