import 'package:online_course_app/src/constants/firestore/collection_name.dart';

import '../../../utils/local_collection_reference.dart';

class LocalReminderCollectionReference extends LocalCollectionReference {
  LocalReminderCollectionReference() : super(CollectionName.reminder);
}
