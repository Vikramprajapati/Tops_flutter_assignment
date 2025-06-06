import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/food.dart';

class FoodImage extends StatelessWidget {
  final Food food;


  FoodImage(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white),
                  )),
            ],
          ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 250,
            width: 250,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.3),
              //     offset: Offset(-1, 10)
              //   )
              // ]



            ),
            child: Image.asset(food.imageUrl,fit: BoxFit.cover),
          ),
        )
        ],
      ),
    );
  }
}
