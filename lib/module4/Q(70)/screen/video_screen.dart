import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Container(
              height: 300,
              width: 100,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Video no. ${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: 10,),
                  Icon(Icons.play_circle,size: 40,)
                ],
              )
          );
        },
      ),
    );
  }
}