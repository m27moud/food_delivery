import 'package:delivery_app/core/widgets/custom_drawer.dart';
import 'package:delivery_app/core/widgets/custom_food_tile.dart';
import 'package:delivery_app/core/widgets/my_current_location.dart';
import 'package:delivery_app/core/widgets/my_description_box.dart';
import 'package:delivery_app/core/widgets/my_tab_bar.dart';
import 'package:delivery_app/features/home/data/models/food_model.dart';
import 'package:delivery_app/features/home/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../../details/presentation/views/details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<FoodModel> _filterMenuByCategory(
    FoodCategory category,
    List<FoodModel> fullMenu,
  ) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<FoodModel> fullMenu) {
    return FoodCategory.values.map((category) {
      List<FoodModel> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final foodModel = categoryMenu[index];

          //return FoodTile UI
          return CustomFoodTile(
            foodModel: foodModel,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsView(foodModel: foodModel),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomSliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  thickness: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                const MyCurrentLocation(),

                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<RestaurantModel>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            );
          },
        ),
      ),
    );
  }
}
