import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/home_screen.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
          () {
        if (_currentUser != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome To My App"),
      ),
    );
  }
}
