import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textStyle=TextStyle(fontSize: 18);

  double font=18;


  void _increaseFont() {
    setState(() {
      font=font+2;
    });
  }

  void _decreaseFont() {
    setState(() {
      font=font-2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Font Increaser App"),
          centerTitle: true,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(onPressed: (){
                _decreaseFont();
              }, child: Text("-",style: textStyle)
              ),

              Text("Vikram",style: TextStyle(fontSize: font),),

              FilledButton(onPressed: (){
                _increaseFont();
              }, child: Text("+",style: textStyle)
              ),


            ],
          ),
        ),
      ),

    );
  }
}


