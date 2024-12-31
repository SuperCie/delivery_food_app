import 'package:delivery_food/components/mycurrentlocation.dart';
import 'package:delivery_food/components/mydescriptionbox.dart';
import 'package:delivery_food/components/mydrawer.dart';
import 'package:delivery_food/components/myfoodtile.dart';
import 'package:delivery_food/components/mysliverbar.dart';
import 'package:delivery_food/components/mytabbar.dart';
import 'package:delivery_food/models/food.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: foodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and returna  list of food items that belong to a specific category
  List<Food> _filterMenuCategory(foodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFilterMenu(List<Food> fullMenu) {
    return foodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            ontap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(
                    food: food,
                  ),
                )),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                Mysliverbar(
                  title: Mytabbar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      //current location
                      const Mycurrentlocation(),
                      //description box
                      Mydescriptionbox()
                    ],
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFilterMenu(restaurant.menu)),
          )),
      drawer: const Mydrawer(),
    );
  }
}
