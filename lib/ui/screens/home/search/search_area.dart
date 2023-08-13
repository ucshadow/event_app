import 'package:flutter/material.dart';

import '../../../../abstract/managers/i_event_manager.dart';
import '../../../../managers/dependency_manager.dart';
import 'custom_search_bar.dart';
import 'filter_menu.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({super.key});

  @override
  Widget build(BuildContext context) {
    final IEventManager eventManager = dependencyManager.getEventManger();
    return CustomSearchBar(
      confirmationRequired: true,
      onChange: (String s) {},
      controller: eventManager.searchController,
      onClear: () {
        eventManager.resetParams();
        eventManager.applySearch(force: true);
      },
      onSubmit: () {
        eventManager.applySearch();
      },
      suffixWidget: Row(
        children: [
          Container(
            height: 28,
            width: 1,
            color: Colors.grey,
          ),
          const FilterMenu(),
        ],
      ),
    );
  }
}
