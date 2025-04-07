import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  void _showToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: "Profile",
                  child: ListTile(
                    title: Text("Profile"),
                    trailing: Icon(Icons.person),
                  )),
              PopupMenuItem(
                  value: "Logout",
                  child: ListTile(
                    title: Text("Logout"),
                    trailing: Icon(Icons.logout),
                  ))
            ],
            onSelected: (value) {
              switch (value) {
                case "Profile":
                  _showToast("Profile Clicked.");
                case "Logout":
                  _showToast("Logout Clicked.");
              }
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
