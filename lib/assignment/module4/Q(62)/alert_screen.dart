import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Alert dialog'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Are you sure to delete this file?"),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("OK")),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("CANCEL"))
                      ],
                    );
                  },
                );
              },
              child: Text("Show Alert Dialog")),
        ));
  }
}
