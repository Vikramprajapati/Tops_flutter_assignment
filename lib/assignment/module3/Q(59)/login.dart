import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Form"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Enter Email Id",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),

                  )
                ),
              )
              ,
              SizedBox(height: 25,),
              TextField(
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),

                    )
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed: () {
                
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
