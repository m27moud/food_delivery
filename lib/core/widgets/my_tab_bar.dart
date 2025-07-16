import 'package:delivery_app/features/home/data/models/food_model.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTaps() {
    return FoodCategory.values.map((category) {
      return Tab(text: category.name);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: tabController, tabs: _buildCategoryTaps());
  }
}
