import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(70)/screen/audio_screen.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(70)/screen/gallery_screen.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(70)/screen/video_screen.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0;

  List<Widget> _selectedWidget = [
    GalleryScreen(),
    VideoScreen(),
    AudioScreen()
  ];

  List<Color> _backColor = [Colors.grey, Colors.green, Colors.amber];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bottom App Bar'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _backColor[_currentIndex],
          currentIndex: _currentIndex, //change item color when clicked
          selectedItemColor: Colors.red, //color of selected item
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: "gallery",
              // backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back),
              label: "video",
              //  backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.audio_file), label: "audio"),
          ],
        ),
        body: _selectedWidget[_currentIndex]);
  }
}
