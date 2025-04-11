import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/model/restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  var restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            restaurant.waitTime,
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(width: 10),
                      Text(
                        restaurant.distance,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Text(restaurant.label,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    restaurant.logoUrl,
                    width: 80,
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.desc,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.orange,
                  ),
                  Text("${restaurant.score}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
