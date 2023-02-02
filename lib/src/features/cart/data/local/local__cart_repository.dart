import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

import '../../model/cart.dart';

abstract class LocalCartRepository {
  Future<LCart> fetchCart();
  Stream<LCart> watchCart();
  Future<void> setCart(LCart cart);
}

class SembastCartRepository implements LocalCartRepository {
  SembastCartRepository(this.db);

  final Database db;
  final store = StoreRef.main();

  static Future<Database> createDatabase(String fileName) async {
    if (kIsWeb) {
      return databaseFactoryWeb.openDatabase(fileName);
    } else {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$fileName');
    }
  }

  static Future<SembastCartRepository> makeDefault() async {
    return SembastCartRepository(await createDatabase('default.db'));
  }

  static const cartItemsKey = 'cartItems';

  @override
  Future<LCart> fetchCart() async {
    final cartJson = await store.record(cartItemsKey).get(db) as String?;
    if (cartJson == null) return const LCart();

    return LCart.fromJson(jsonDecode(cartJson));
  }

  @override
  Future<void> setCart(LCart cart) {
    return store.record(cartItemsKey).put(db, jsonEncode(cart.toJson()));
  }

  @override
  Stream<LCart> watchCart() {
    final record = store.record(cartItemsKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot == null || snapshot.value == null) return const LCart();

      return LCart.fromJson(jsonDecode(snapshot.value as String));
    });
  }

  // call this when the DB is no longer needed
  void dispose() => db.close();
}
