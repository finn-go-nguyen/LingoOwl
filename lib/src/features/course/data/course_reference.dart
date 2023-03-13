import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/course.dart';

class CourseReference extends BaseCollectionReference<LCourse> {
  CourseReference(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.course).withConverter(
                fromFirestore: (snapshot, options) =>
                    LCourse.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
