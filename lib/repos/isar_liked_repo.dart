import 'package:isar/isar.dart';

import '../abstract/i_liked.dart';
import '../abstract/repos/i_liked_repo.dart';
import '../db/i.dart';

class IsarLikedRepo implements ILikedRepo {
  static final IsarLikedRepo _instance = IsarLikedRepo._internal();

  late Future<Isar> _db;

  IsarLikedRepo._internal() {
    _db = I().get();
  }

  factory IsarLikedRepo() {
    return _instance;
  }

  @override
  Future<ILiked?> getById(String id) async {
    // TODO: implement createNew
    throw UnimplementedError();
  }

  @override
  ILiked createNew(String id) {
    // TODO: implement createNew
    throw UnimplementedError();
  }

  @override
  Future<List<ILiked>> getByIds(List<String> ids) {
    // TODO: implement getByIds
    throw UnimplementedError();
  }

  @override
  Future<void> removeLiked(String id) {
    // TODO: implement removeLiked
    throw UnimplementedError();
  }

  @override
  Future<void> saveLiked(ILiked liked) {
    // TODO: implement saveLiked
    throw UnimplementedError();
  }
}
