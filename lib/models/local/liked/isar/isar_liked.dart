import 'package:isar/isar.dart';

import '../../../../abstract/i_liked.dart';


part 'isar_liked.g.dart';

@collection
class IsarLiked implements ILiked {

  @Index()
  Id id = Isar.autoIncrement;

  @override
  String? localId;

  @override
  DateTime? likedAt;
}