import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/food.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen2/widget/food_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food food;

  FoodDetail(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            food.name,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTextIcon(
                  Icons.access_time_outlined, Colors.blue, food.waitTime),
              _buildTextIcon(Icons.star, Colors.yellow, food.score.toString()),
              _buildTextIcon(
                  Icons.local_fire_department_rounded, Colors.red, food.cal),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          FoodQuantity(food),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        children: [
                          Image.asset(
                            food.ingredients[index].values.first,
                            width: 52,
                          ),
                          Text(food.ingredients[index].keys.first),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                itemCount: food.ingredients.length),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "About",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            food.about,
            style: TextStyle(
              wordSpacing: 1.2,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTextIcon(IconData icon, Color color, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 20,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 16),
      )
    ],
  );
}
