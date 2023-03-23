import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums/enrolled_course_status.dart';
import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/enrolled_course.dart';

final enrolledCoursesProvider =
    StreamProvider.autoDispose<List<EnrolledCourse>>((ref) {
  final enrolledCourseRepository =
      ref.watch(DomainManager.instance.enrolledCourseRepositoryProvider);

  final uid = ref.watch(uidProvider);
  if (uid == null) return Stream.value(<EnrolledCourse>[]);
  return enrolledCourseRepository.getEnrolledCourses(uid);
});

final enrolledCoursesByStatusProvider = FutureProvider.autoDispose
    .family<List<EnrolledCourse>, EnrolledCourseStatus>((ref, status) async {
  ref.keepAlive();
  final enrolledCourses = await ref.watch(enrolledCoursesProvider.future);

  if (status.isAll) {
    return enrolledCourses
        .where((element) => !element.status.isArchived)
        .toList();
  }
  return enrolledCourses.where((element) => element.status == status).toList();
});

final enrolledCourseIdsProvider = Provider.autoDispose<List<CourseId>>((
  ref,
) {
  ref.keepAlive();
  final enrolledCourses = ref.watch(enrolledCoursesProvider).value;
  if (enrolledCourses == null) return <CourseId>[];
  return enrolledCourses.map((e) => e.courseId).toList();
});

abstract class EnrolledCourseRepository {
  Stream<List<EnrolledCourse>> getEnrolledCourses(UserId uid);
  Future<void> updateStatus(
    UserId uid,
    CourseId courseId,
    EnrolledCourseStatus status,
  );
  Future<void> addEnrolledCourses(UserId userId, List<CourseId> courseIds);
}

class FirestoreEnrolledCourseRepository
    extends BaseCollectionReference<List<EnrolledCourse>>
    implements EnrolledCourseRepository {
  FirestoreEnrolledCourseRepository(FirebaseFirestore firestore)
      : super(
          // * Store all enrolledCourse object in 1 user document for cost
          // * optimization.
          // * Firebase allow maximum 1 MB per document
          // * (~10000 enrolledCourse objects)
          firestore.collection(CollectionName.enrolledCourse).withConverter(
            fromFirestore: (snapshot, options) {
              final result = <EnrolledCourse>[];
              for (var course in snapshot.data()!['courses']) {
                result.add(EnrolledCourse.fromJson(course));
              }
              return result;
            },
            toFirestore: (value, options) {
              return {'courses': value.map((e) => e.toJson())};
            },
          ),
        );

  @override
  Stream<List<EnrolledCourse>> getEnrolledCourses(UserId uid) async* {
    await for (var element in snapshots(uid)) {
      yield element ?? <EnrolledCourse>[];
    }
  }

  @override
  Future<void> updateStatus(
      UserId uid, CourseId courseId, EnrolledCourseStatus status) {
    // TODO: implement updateStatus
    throw UnimplementedError();
  }

  @override
  Future<void> addEnrolledCourses(
      UserId userId, List<CourseId> courseIds) async {
    final docRef = ref.doc(userId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docRef.update({
        'courses': FieldValue.arrayUnion(courseIds.map((e) {
          final enrolledCourse = EnrolledCourse(
            uid: userId,
            courseId: e,
            timeStamp: DateTime.now().millisecondsSinceEpoch,
          );
          return enrolledCourse.toJson();
        }).toList())
      });
    }

    return docRef.set(
      courseIds.map((e) {
        final enrolledCourse = EnrolledCourse(
          uid: userId,
          courseId: e,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
        return enrolledCourse;
      }).toList(),
    );
  }
}
