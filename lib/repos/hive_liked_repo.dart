import 'package:hive/hive.dart';

import '../abstract/i_liked.dart';
import '../abstract/repos/i_liked_repo.dart';
import '../models/local/liked/hive/hive_liked.dart';

class HiveLikedRepo implements ILikedRepo {
  static final HiveLikedRepo _instance = HiveLikedRepo._internal();

  HiveLikedRepo._internal();

  factory HiveLikedRepo() {
    return _instance;
  }

  @override
  Future<void> saveLiked(ILiked liked) async {
    var box = await Hive.openBox<HiveLiked>('likedBox');
    box.put(liked.localId, liked as HiveLiked);
  }

  @override
  Future<void> removeLiked(String id) async {
    var box = await Hive.openBox<HiveLiked>('likedBox');
    box.delete(id);
  }

  @override
  Future<HiveLiked?> getById(String id) async {
    var box = await Hive.openBox<HiveLiked>('likedBox');
    return box.values.where((HiveLiked element) => element.localId == id).firstOrNull;
  }

  @override
  Future<List<HiveLiked>> getByIds(List<String> ids) async {
    var box = await Hive.openBox<HiveLiked>('likedBox');
    return box.values
        .where((HiveLiked element) => ids.contains(element.localId))
        .toList();
  }

  @override
  ILiked createNew(String id) {
    return HiveLiked(
      localId: id,
      likedAt: DateTime.now(),
    );
  }
}
