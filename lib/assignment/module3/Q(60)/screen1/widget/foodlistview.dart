import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/restaurant.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen2/screen2.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen1/widget/fooditem.dart';

class Foodlistview extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurant restaurant;

  Foodlistview({required this.selected,
    required this.callback,
    required this.pageController,
    required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final category = restaurant!.menu.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map((e) =>
            ListView.separated(
              itemBuilder: (context, index) =>
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              Screen2(restaurant
                                  .menu[category[selected]]![index]),));
                      },
                      child: FoodItem(
                          restaurant.menu[category[selected]]![index])
                  ),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    height: 15,
                  ),
              itemCount: restaurant.menu[category[selected]]!.length,
            ))
            .toList(),
      ),
    );
  }
}
