import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module4/Q(70)/bottom_bar_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BottomBarScreen(),
    );
  }
}
