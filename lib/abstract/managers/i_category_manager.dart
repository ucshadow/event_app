import 'package:flutter/material.dart';

import '../../models/remote/ticket_master_category/tm_category.dart';

abstract class ICategoryManager {
  final List<TMCategory> items = [];
  TMCategory selected = TMCategory.empty();
  void registerCategoryIdState(String id, State state);
  late State menuState;
  bool isLoading = false;
  Future<void> fetchCategories();
  void toggleCategory(TMCategory category);
}