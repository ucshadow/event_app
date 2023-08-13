import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/local/liked/isar/isar_liked.dart';


class I {
  static final I _instance = I._internal();
  late Future<Isar> _db;

  I._internal() {
    _db = openDB();
  }

  factory I() {
    return _instance;
  }

  Future<Isar> get() async {
    return _db;
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          IsarLikedSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> clearDb() async {
    (await _db).writeTxn(() async {
      (await _db).clear();
    });
  }
}
