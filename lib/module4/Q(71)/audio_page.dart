import 'package:flutter/material.dart';

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioList = List.generate(10, (index) => 'Audio Track ${index + 1}');

    return ListView.builder(
      itemCount: audioList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.audiotrack),
        title: Text(audioList[index]),
        subtitle: Text('Artist Name'),
        trailing: Icon(Icons.play_arrow),
      ),
    );
  }
}
