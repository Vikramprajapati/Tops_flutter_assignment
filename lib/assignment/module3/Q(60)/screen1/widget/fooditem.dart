import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
                height: 110,
                width: 110,
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  food.imageUrl,
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
                      )
                    ],
                  ),
                  Text(
                    food.desc,
                    style: TextStyle(
                        color: food.hightLight
                            ? Colors.orange.shade400
                            : Colors.grey.withOpacity(0.8),
                        ),
                  ),
                   SizedBox(height: 5,),
                 Row(
                   children: [
                     Text(
                       "\$",
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                     ),
                     Text(
                       "${food.price}",
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                     )
                   ],
                 )
                ],
              ),
            ))
          ],
        ));
  }
}
