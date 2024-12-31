import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';

class Mytabbar extends StatelessWidget {
  final TabController tabController;
  const Mytabbar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return foodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          // isScrollable: true,
          labelStyle:
              const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          dividerColor: Colors.transparent,
          controller: tabController,
          tabs: _buildCategoryTabs()),
    );
  }
}
