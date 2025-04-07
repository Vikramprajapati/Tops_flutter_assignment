import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module4/Q(74)/next_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(),));
              }, child: Text("Next")),
            );
          }
        )
      ),
    );
  }
}
