import 'package:hive/hive.dart';

import '../models/local/liked/hive/hive_liked.dart';


class H {

  static final H _instance = H._internal();

  H._internal();

  factory H() {
    return _instance;
  }

  void register() {
    Hive.registerAdapter(HiveLikedAdapter());
  }
}