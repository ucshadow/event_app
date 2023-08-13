import '../i_liked.dart';

abstract class ILikedRepo {
  Future<void> saveLiked(ILiked liked);
  Future<void> removeLiked(String id);
  Future<ILiked?> getById(String id);
  Future<List<ILiked>> getByIds(List<String> ids);
  ILiked createNew(String id);
}