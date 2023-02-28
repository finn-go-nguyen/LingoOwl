import 'dart:convert';

import 'package:online_course_app/src/constants/firestore/collection_name.dart';
import 'package:online_course_app/src/features/cart/model/cart.dart';

import '../../../../utils/local_collection_reference.dart';

class LocalCartCollectionReference extends LocalCollectionReference<LCart> {
  LocalCartCollectionReference()
      : super(
          CollectionName.cart,
          toJson: (cart) => jsonEncode(cart.toJson()),
          fromJson: (jsonString) => LCart.fromJson(jsonDecode(jsonString)),
        );
}
