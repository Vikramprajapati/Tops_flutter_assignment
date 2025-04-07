import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/module4/Q(69)/screen/inbox_screen.dart';
import 'package:tops_flutter_assignment/module4/Q(69)/widget/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _currentScreen = InboxScreen();

  void _selectedScreen(Widget screen)
  {
    setState(() {
      _currentScreen=screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gmail-Clone"),
          centerTitle: true,
        ),
        body: _currentScreen,
        drawer: NavigationDrawerScreen(onSelectedScreen: _selectedScreen));
  }
}
