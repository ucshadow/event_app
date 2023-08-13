import '../abstract/managers/i_category_manager.dart';
import '../abstract/managers/i_event_manager.dart';
import '../abstract/managers/i_local_data_manager.dart';
import '../abstract/repos/i_liked_repo.dart';
import '../repos/hive_liked_repo.dart';
import 'local_data_manager.dart';
import 'tm_category_manager.dart';
import 'tm_event_manager.dart';

class DependencyManager {
  ILikedRepo getILikedRepo() {
    return HiveLikedRepo();

    // we can also return IsarLikedRepo(), depends on which db we want to use
  }

  IEventManager getEventManger() {
    return tmEventManager;
  }

  ILocalDataManager getLocalDataManager() {
    return localDataManager;
  }

  ICategoryManager getCategoryManager() {
    return tmCategoryManager;
  }
}

DependencyManager dependencyManager = DependencyManager();