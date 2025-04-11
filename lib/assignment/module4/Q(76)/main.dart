import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(76)/next_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _number1Contrller = TextEditingController();
  final _number2Contrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Builder(
          builder: (context) =>
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _number1Contrller,
                      decoration: InputDecoration(
                          label: Text("Enter 1st Number"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          )
                      ),
                      keyboardType: TextInputType.number,


                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _number2Contrller,
                      decoration: InputDecoration(
                          label: Text("Enter 2nd Number"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          int num1 = int.parse(_number1Contrller.text);
                          int num2 = int.parse(_number2Contrller.text);

                          // if (_number1Contrller.text.toString().contains() {
                          //
                          // };


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NextScreen(
                                      num1: num1,
                                      num2: num2,
                                    ),
                              ));
                        },
                        child: Text("Next"))
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
