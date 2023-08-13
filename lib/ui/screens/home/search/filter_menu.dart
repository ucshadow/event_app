import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../abstract/managers/i_category_manager.dart';
import '../../../../managers/dependency_manager.dart';
import '../../../../models/remote/ticket_master_category/tm_category.dart';
import 'filter_menu_item.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  final dropdownKey = GlobalKey<DropdownButton2State>();
  final ICategoryManager categoryManager = dependencyManager.getCategoryManager();

  @override
  void initState() {
    categoryManager.menuState = this;
    categoryManager.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (categoryManager.isLoading) {
      return const SizedBox(
        height: 26,
        width: 140,
        child: Center(
          child: SizedBox(height: 4, child: LinearProgressIndicator()),
        ),
      );
    }
    return Material(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<TMCategory>(
            isExpanded: false,
            key: dropdownKey,
            isDense: true,
            hint: Text(categoryManager.selected.name),
            iconStyleData: IconStyleData(
              icon: const Icon(Icons.keyboard_arrow_down),
              openMenuIcon: const Icon(Icons.keyboard_arrow_up),
              iconEnabledColor: Theme.of(context).colorScheme.secondary,
            ),
            items: categoryManager.items.map((item) {
              return DropdownMenuItem(
                value: item,
                enabled: true,
                child: FilterMenuItem(
                  item: item,
                ),
              );
            }).toList(),
            value: categoryManager.selected,
            onChanged: (value) {},
            selectedItemBuilder: (context) {
              return categoryManager.items.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      categoryManager.selected.name,
                      style: const TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(left: 8),
              height: 26,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
