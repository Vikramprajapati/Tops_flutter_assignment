import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {


  int num1,num2;
  NextScreen({required this.num1, required this.num2});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Text("${num1+num2}",style: TextStyle(fontSize: 24),),
        ),
      ),
    );
  }


}
