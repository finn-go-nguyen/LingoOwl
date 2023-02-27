import 'package:online_course_app/src/constants/firestore/collection_name.dart';

import '../../../../utils/local_collection_reference.dart';

class LocalCartCollectionReference extends LocalCollectionReference {
  LocalCartCollectionReference() : super(CollectionName.cart);
}
