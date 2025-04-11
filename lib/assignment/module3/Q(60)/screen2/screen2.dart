import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/food.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen1/widget/custom_appBar.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen2/widget/food_detail.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen2/widget/food_image.dart';

class Screen2 extends StatelessWidget {
  final Food food;

  Screen2(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              Icons.arrow_back_ios_rounded,
              Icons.favorite_outline_sharp,
              leftCallback: () => Navigator.pop(context),
            ),
            SizedBox(
              height: 60,
            ),
            FoodImage(food),
            FoodDetail(food),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 56,
        width: 100,
        child: RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.black,
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    food.quantity.toString(),
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
