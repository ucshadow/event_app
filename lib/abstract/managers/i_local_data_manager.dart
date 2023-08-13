import 'package:flutter/material.dart';

abstract class ILocalDataManager {
  Future<void> toggleLiked(String id, State state,
      {bool alreadyLiked = false});
  Future<bool> isLikedById(String id);
}