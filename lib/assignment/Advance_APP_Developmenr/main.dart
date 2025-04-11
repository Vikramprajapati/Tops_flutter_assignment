import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/login_page.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/welcome.dart';


import '../../assignment/Advance_APP_Developmenr/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth + API App',
        theme: ThemeData(primarySwatch: Colors.blue),
       // home: FirebaseAuth.instance.currentUser != null
         //   ? HomeScreen()
         //   : LoginPage()
         home: SplashScreen(),

        );
  }
}
