import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class LocalCollectionReference {
  LocalCollectionReference(this._collectionName);

  final String _collectionName;
  late DatabaseFactory _dbFactory;
  late Database db;
  // dynamically typed store
  late final ref = StoreRef<String, String?>.main();

  Future<void> init() async {
    _dbFactory = kIsWeb ? databaseFactoryWeb : databaseFactoryIo;
    db = await _createDatabase(_collectionName);
  }

  Future<void> set(Object object) async {
    ref.record(_collectionName).put(db, jsonEncode(object));
  }

  Future<String?> get() async {
    final value = await ref.record(_collectionName).get(db);
    return value;
  }

  Stream<String?> snapshots() {
    final recordRef = ref.record(_collectionName);
    return recordRef.onSnapshot(db).map((snapshot) {
      return snapshot?.value;
    });
  }

  Future<Database> _createDatabase(String collectionName) async {
    late String path;
    if (kIsWeb) {
      path = collectionName;
    } else {
      final appDocDir = await getApplicationDocumentsDirectory();
      path = '${appDocDir.path}/$collectionName';
    }
    return _dbFactory.openDatabase('$path.db');
  }

  void dispose() => db.close();
}
