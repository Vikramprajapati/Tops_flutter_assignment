import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(62)/alert_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AlertScreen(),
      );

  }
}
