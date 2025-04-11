import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter layout demo"),
          centerTitle: true,

        ),
        body: Column(
          children: [
            Container(

              child: Image.asset('assets/images/image.jpeg',

                alignment: Alignment.center,
                width: 400,
                height: 225,
                fit: BoxFit.fill,

              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30,left: 25),

                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Oeschinen Lake Campground",
                          style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text("Kandersteg, Switzerland",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey.shade500,


                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 50,top: 25),

                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.red,),

                        Text('41',
                          style: TextStyle(fontSize: 15),)

                      ],


                    ),
                  )
                ]


            ),

            Container(

              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getColumn('CALL', Icons.call, Colors.blue),
                  _getColumn('ROUTE', Icons.send, Colors.blue),
                  _getColumn('SHARE', Icons.share, Colors.blue),

                ],
              ),
            ),

            Container(
                margin: EdgeInsets.only(left: 25,top: 25,right: 22),

                child: Text("Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
                  style: TextStyle(
                    fontSize: 16,

                  ),
                )),

          ],
        ),

      ),
    );
  }
}

Widget _getColumn(String title, IconData icon, Color color) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 22,
        color: color,
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
        ),
      )
    ],
  );
}
