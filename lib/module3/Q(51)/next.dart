import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {

  int start,end;

  NextScreen({required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    List<int> numberList=[];
    for(int i=start+1;i<end;i++){
      numberList.add(i);

    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: numberList.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text("${numberList[index]}"),
          );
        },),
      ),
    );
  }
}
