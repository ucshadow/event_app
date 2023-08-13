import 'package:flutter/material.dart';

import '../abstract/managers/i_category_manager.dart';
import '../abstract/managers/i_event_manager.dart';
import '../models/remote/ticket_master_category/tm_category.dart';
import '../net/ticket_master_api.dart';
import '../util/state_controller.dart';
import 'dependency_manager.dart';

class TMCategoryManager extends StateController implements ICategoryManager {
  @override
  final List<TMCategory> items = [TMCategory.empty()];

  Future<List<TMCategory>>? _getCategories;

  final Map<String, State> _catIdToState = {};

  @override
  TMCategory selected = TMCategory.empty();

  @override
  late State menuState;

  @override
  bool isLoading = false;

  @override
  Future<void> fetchCategories() async {
    isLoading = true;
    rebuildWidgets(states: [menuState]);
    if (_getCategories != null) {
      return;
    }
    if (items.length == 1) {
      _getCategories = TicketMasterApi().getCategories();
      items.addAll(await _getCategories!);
    }
    _getCategories = null;
    isLoading = false;
    rebuildWidgets(states: [menuState]);
  }

  @override
  void toggleCategory(TMCategory category) {
    final IEventManager eventManager = dependencyManager.getEventManger();
    TicketMasterApi().toggleCategory(category);
    if(selected == category) {
      selected = TMCategory.empty();
      rebuildWidgets(states: [_catIdToState[category.id]!, _catIdToState['1']!]);
    } else {
      final String prevId = selected.id;
      selected = category;
      rebuildWidgets(states: [_catIdToState[category.id]!, _catIdToState[prevId]!]);
    }
    rebuildWidgets(states: [menuState]);
    eventManager.resetParams();
    eventManager.applySearch(force: true);
  }

  @override
  void registerCategoryIdState(String id, State state) {
    _catIdToState[id] = state;
  }
}

TMCategoryManager tmCategoryManager = TMCategoryManager();