import 'package:flutter/material.dart';

import '../abstract/managers/i_local_data_manager.dart';
import '../abstract/repos/i_liked_repo.dart';
import 'dependency_manager.dart';
import '../util/state_controller.dart';

class LocalDataManager extends StateController implements ILocalDataManager {
  /// When the user presses the heart on the Event card
  @override
  Future<void> toggleLiked(String id, State state,
      {bool alreadyLiked = false}) async {
    final ILikedRepo repo = dependencyManager.getILikedRepo();
    if (alreadyLiked) {
      await repo.removeLiked(id);
    } else {
      await repo.saveLiked(repo.createNew(id));
    }
    rebuildWidgets(states: [state]);
  }

  /// Hive does not have the ability to observe values so we do it the old way
  @override
  Future<bool> isLikedById(String id) async {
    final ILikedRepo repo = dependencyManager.getILikedRepo();
    return (await repo.getById(id)) != null;
  }
}

LocalDataManager localDataManager = LocalDataManager();
