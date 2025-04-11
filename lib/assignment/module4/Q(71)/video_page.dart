import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoList = List.generate(8, (index) => 'Video Clip ${index + 1}');

    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.video_collection),
        title: Text(videoList[index]),
        subtitle: Text('Duration: ${(index + 1) * 2} mins'),
        trailing: Icon(Icons.play_circle_outline),
      ),
    );
  }
}
