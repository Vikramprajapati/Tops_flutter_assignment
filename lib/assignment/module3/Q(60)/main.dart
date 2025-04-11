import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tops_flutter_assignment/assignment/module3/Q(60)/screen1/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Screen1(),
    );
  }
}
