import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module3/Q(60)/model/food.dart';

class FoodQuantity extends StatelessWidget {
 final Food food;

 FoodQuantity(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.3, 0),
            child: Container(
              width: 120,
              height: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Text("\$",style: TextStyle(fontSize:12,fontWeight: FontWeight.bold ),),
                  Text(food.price.toString(),style: TextStyle(fontSize:24,fontWeight: FontWeight.bold ),)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.3, 0),
            child: Container(
              height: double.maxFinite,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Text(food.quantity.toString()),
                  ),
                  Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
