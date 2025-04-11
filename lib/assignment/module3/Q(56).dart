import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Images Around TextView'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
              height: 500,
              width: 600,
              child: Stack(
                        alignment: Alignment.center,
                        children: [
              Positioned(
                  top: 50,
                  child: Image.asset("assets/images/image.jpeg",
                    width: 100,
                    height: 100,
                  )),
              Positioned(
                  bottom:50,
                  child: Image.asset("assets/images/image.jpeg",
                    width: 100,
                    height: 100,)),
              Positioned(
                  left: 50,
                  child: Image.asset("assets/images/image.jpeg",
                    width: 100,
                    height: 100,)),
              Positioned(
                  right: 50,
                  child: Image.asset("assets/images/image.jpeg",
                    width: 100,
                    height: 100,)),
              Text("Center Text", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

                        ],
                      ),
            )),
      ),
    );
  }
}
