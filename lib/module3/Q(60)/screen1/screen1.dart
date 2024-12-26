import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/model/restaurant.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/screen1/widget/custom_appBar.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/screen1/widget/food_list.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/screen1/widget/foodlistview.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/screen1/widget/restaurant_info.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(Icons.arrow_back_ios_rounded, Icons.search_outlined),
            RestaurantInfo(),
            FoodList(
              selected: selected,
              callback: (int index) {
                setState(() {
                  selected = index;
                });

                // switch page
                pageController.jumpToPage(index);
              },
              restaurant: restaurant,
            ),
            Expanded(
                child: Foodlistview(
                    selected: selected,
                    callback: (int index) {
                      setState(() {
                        selected = index;
                      });
                    },
                    pageController: pageController,
                    restaurant: restaurant)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 60,
              child: SmoothPageIndicator(
                controller: pageController,
                count: restaurant.menu.length,
                effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                        width: 8,
                        height: 8,
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    activeDotDecoration: DotDecoration(
                        height: 10,
                        width: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        dotBorder: DotBorder(
                            color: Colors.orange.shade300,
                            padding: 2,
                            width: 2))),
                onDotClicked: (index) => pageController.jumpToPage(index),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange.shade300,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          size: 35,
        ),
      ),
    );
  }
}
