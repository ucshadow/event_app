import 'package:hive/hive.dart';

import '../../../../abstract/i_liked.dart';


part 'hive_liked.g.dart';

@HiveType(typeId: 1)
class HiveLiked implements ILiked {
  @override
  @HiveField(0)
  String? localId;

  @override
  @HiveField(1)
  DateTime? likedAt;

  HiveLiked({
    this.localId,
    this.likedAt,
  });
}