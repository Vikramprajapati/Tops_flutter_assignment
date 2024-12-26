import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _numberController=TextEditingController();
  final _reverseController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Print Reverse Number'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    label: Text("Enter Number"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: () {
                  String number=_numberController.text.split("").reversed.join("");
                  _reverseController.text=number;

                }, child: Text("Reverse Number")),
                SizedBox(height: 16,),
                TextField(
                  controller: _reverseController,
                  decoration: InputDecoration(
                    label: Text("Reverse Number"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
