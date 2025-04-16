import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Dashboard(),
    );
  }
}
