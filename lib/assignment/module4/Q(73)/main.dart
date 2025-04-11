import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(73)/home_screen.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(73)/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
