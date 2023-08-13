import 'package:flutter/material.dart';

import '../../../../abstract/managers/i_category_manager.dart';
import '../../../../managers/dependency_manager.dart';
import '../../../../models/remote/ticket_master_category/tm_category.dart';

class FilterMenuItem extends StatefulWidget {
  const FilterMenuItem({
    super.key,
    required this.item,
  });

  final TMCategory item;

  @override
  State<FilterMenuItem> createState() => _FilterMenuItemState();
}

class _FilterMenuItemState extends State<FilterMenuItem> {

  final ICategoryManager categoryManager = dependencyManager.getCategoryManager();

  @override
  void initState() {
    categoryManager.registerCategoryIdState(widget.item.id, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = categoryManager.selected == widget.item;
    return InkWell(
      onTap: () {
        categoryManager.toggleCategory(widget.item);
      },
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            if (isSelected)
              const Icon(Icons.check_box_outlined)
            else
              const Icon(Icons.check_box_outline_blank),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
