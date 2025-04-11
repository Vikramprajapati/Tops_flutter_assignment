import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  void showToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Choose one Option..."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showToast("NEUTRAL Clicked");
                            },
                            child: Text("NEUTRAL")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showToast("POSITIVE Clicked");
                            },
                            child: Text("POSITIVE")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showToast("NEGATIVE Clicked");
                            },
                            child: Text("NEGATIVE"))
                      ],
                    );
                  },
                );
              },
              child: Text("Show Alert Dialog"))),
    );
  }
}
