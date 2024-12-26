import 'package:flutter/material.dart';

import 'package:tops_flutter_assignment/module3/Q(51)/next.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _number1Controller = TextEditingController();
  final _number2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _number1Controller,
                        decoration: InputDecoration(
                            label: Text('Enter 1st Number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _number2Controller,
                        decoration: InputDecoration(
                            label: Text('Enter 2nd Number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Container(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: () {
                              int  num1= int.parse(_number1Controller.text);
                              int num2 = int.parse(_number2Controller.text);

                              if(num1<=num2)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NextScreen(
                                          start: num1,
                                          end: num2,
                                        ),
                                      ));
                                }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Num2 should be greater or all equal to num1.")));
                              }
                            },
                            child: Text('Next')
                        ),
                      )
                    ],
                  )),
            );
          }
        ),
      ),
    );
  }
}
