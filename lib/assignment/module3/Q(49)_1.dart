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
        backgroundColor: Colors.grey.shade100,

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
            
                SizedBox(height: 20,),
                Container(
                  height: 190,
                  width: double.infinity,
                  color: Colors.red,
                ),
          
                SizedBox(height: 8,),
          
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Row(
          
                    children: [
          
                      Container(
                        height: 183,
                        width: 177,
                        color: Colors.blue,
                      ),
          
                      SizedBox(width: 8,),
          
          
                      Container(
                        height: 183,
                        width: 177,
                        color: Colors.blue,
                      )
                    ],
          
                  ),
                ),
          
                SizedBox(height: 8,),
          
                Row(
          
                  children: [
          
                    Container(
                      height: 183,
                      width: 177,
                      color: Colors.blue,
                    ),
          
                    SizedBox(width: 8,),
          
          
                    Container(
                      height: 183,
                      width: 177,
                      color: Colors.blue,
                    )
                  ],
          
                ),
          
                SizedBox(height: 8,),
          
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
                  children: [
          
                    Container(
                      height: 120,
                      width:115 ,
                      color: Colors.yellow,
                    ),
          
                    SizedBox(width: 8,),
          
          
                    Container(
                      height: 120,
                      width:115 ,
          
                      color: Colors.yellow,
                    ),
          
          
                    SizedBox(width: 8),
          
                    Container(
                      height: 120,
                      width:115 ,
                      color: Colors.yellow,
                    )
                  ],
          
                ),
                SizedBox(height: 8,),
          
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
                  children: [
          
                    Container(
                      height: 120,
                      width:115 ,
                      color: Colors.yellow,
                    ),
          
                    SizedBox(width: 8,),
          
          
                    Container(
                      height: 120,
                      width:115 ,
          
                      color: Colors.yellow,
                    ),
          
          
                    SizedBox(width: 8),
          
                    Container(
                      height: 120,
                      width:115 ,
                      color: Colors.yellow,
                    )
                  ],
          
                )
              ],
            
            ),
          
          ),
        ),


      ),


    );
  }
}
