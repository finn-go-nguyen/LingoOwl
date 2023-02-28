import 'dart:convert';

import '../../../../constants/firestore/collection_name.dart';
import '../../../../utils/local_collection_reference.dart';
import '../../model/cart.dart';

class LocalCartCollectionReference extends LocalCollectionReference<LCart> {
  LocalCartCollectionReference()
      : super(
          CollectionName.cart,
          toJson: (cart) => jsonEncode(cart.toJson()),
          fromJson: (jsonString) => LCart.fromJson(jsonDecode(jsonString)),
        );
}
