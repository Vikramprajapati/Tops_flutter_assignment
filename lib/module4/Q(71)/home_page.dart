import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module4/Q(71)/audio_page.dart';
import 'package:tops_flutter_assignment/module4/Q(71)/gallery_page.dart';
import 'package:tops_flutter_assignment/module4/Q(71)/video_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];

  final List<String> _titles = ['Gallery', 'Audio', 'Video'];

  void _onSelectDrawerItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Navigation Menu',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Gallery'),
              onTap: () => _onSelectDrawerItem(0),
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Audio'),
              onTap: () => _onSelectDrawerItem(1),
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Video'),
              onTap: () => _onSelectDrawerItem(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
