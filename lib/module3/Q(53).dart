import 'dart:math';

import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Color> colorlist=[Colors.black,Colors.red,Colors.pink,Colors.purple,Colors.yellow,Colors.orange];

  Color selectedColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: selectedColor,
        appBar: AppBar(
          title: Text("Background Changer"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(onPressed: (){
            setState(() {
              int  index=Random().nextInt(colorlist.length);
              selectedColor=colorlist[index];
            });

          }, child: Text("Change Background Color")),

        ),
      ),

    );
  }
}
