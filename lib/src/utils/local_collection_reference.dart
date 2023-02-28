import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class LocalCollectionReference<T> {
  LocalCollectionReference(
    this._collectionName, {
    required this.toJson,
    required this.fromJson,
  });

  final String Function(T item) toJson;
  final T Function(String jsonString) fromJson;

  final String _collectionName;
  late DatabaseFactory _dbFactory;
  late Database db;
  // dynamically typed store
  late final ref = StoreRef<String, String?>.main();

  Future<void> init() async {
    _dbFactory = kIsWeb ? databaseFactoryWeb : databaseFactoryIo;
    db = await _createDatabase(_collectionName);
  }

  Future<void> set(T item) async {
    ref.record(_collectionName).put(db, toJson(item));
  }

  Future<T?> get() async {
    final value = await ref.record(_collectionName).get(db);
    if (value == null) return null;

    return fromJson(value);
  }

  Stream<T?> snapshots() {
    final recordRef = ref.record(_collectionName);
    return recordRef.onSnapshot(db).map((snapshot) {
      if (snapshot == null || snapshot.value == null) return null;

      return fromJson(snapshot.value!);
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
