import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color selectedColor = Colors.white;

  String? color;

  void _changedRadioSelection(String? value) {
    setState(() {
      color = value;
      switch (color) {
        case "Red":
          selectedColor = Colors.red;
          break;

        case "Blue":
          selectedColor = Colors.blue;
          break;

        case "Yellow":
          selectedColor = Colors.yellow;
          break;

        case "Orange":
          selectedColor = Colors.orange;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: selectedColor,
        appBar: AppBar(
          title: Text('Background Change using Radio Button'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checked color to set Background',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Radio(
                      value: "Red",
                      groupValue: color,
                      onChanged: (value) {
                        _changedRadioSelection(value);
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Red")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Blue",
                      groupValue: color,
                      onChanged: (value) {
                        _changedRadioSelection(value);
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Blue")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Yellow",
                      groupValue: color,
                      onChanged: (value) {
                        _changedRadioSelection(value);
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Yellow")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Orange",
                      groupValue: color,
                      onChanged: (value) {
                        _changedRadioSelection(value);
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Orange")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
