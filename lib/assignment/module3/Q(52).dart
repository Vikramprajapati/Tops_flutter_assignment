import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  final _resultController = TextEditingController();

  int? option;

  void _radioSelectionChanged(int? value) {
    setState(() {
      option = value;
      int num1 = int.parse(_num1Controller.text.toString());
      int num2 = int.parse(_num2Controller.text.toString());


      switch (option) {
        case 1:
      _resultController.text=(num1+num2).toString();
        case 2:
          _resultController.text=(num1-num2).toString();
        case 3:
          _resultController.text=(num1*num2).toString();
        case 4:
          _resultController.text=(num1/num2).toString();

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculator Using Radio Button'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _num1Controller,
                decoration: InputDecoration(
                    label: Text("First Value"),
                    hintText: "Enter the number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _num2Controller,
                decoration: InputDecoration(
                    label: Text("Second Value"),
                    hintText: "Enter the number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: option,
                    onChanged: (value) {
                      _radioSelectionChanged(value);
                    },
                  ),
                  Text("ADD"),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 2,
                    groupValue: option,
                    onChanged: (value) {
                      _radioSelectionChanged(value);
                    },
                  ),
                  Text("SUB"),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 3,
                    groupValue: option,
                    onChanged: (value) {
                      _radioSelectionChanged(value);
                    },
                  ),
                  Text("MUL"),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 4,
                    groupValue: option,
                    onChanged: (value) {
                      _radioSelectionChanged(value);
                    },
                  ),
                  Text("DIV"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _resultController,
                decoration: InputDecoration(
                    label: Text("Result"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                keyboardType: TextInputType.number,
              )
            ],
          ),
        )),
      ),
    );
  }
}
