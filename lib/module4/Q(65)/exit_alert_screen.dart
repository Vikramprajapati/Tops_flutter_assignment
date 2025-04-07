import 'package:flutter/material.dart';

class ExitAlertScreen extends StatefulWidget {
  @override
  State<ExitAlertScreen> createState() => _ExitAlertScreenState();
}

class _ExitAlertScreenState extends State<ExitAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exit Alert Dialog"),
      ),
      body: WillPopScope(
        onWillPop: showExitDialog,
        child: Center(
          child: Text("Exit Alert Dialog"),
        ),
      ),
    );
  }

  Future<bool> showExitDialog() async {
    return await showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Alert"),
          content: Text("Do you want to exit this app?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("CANCEL")),
            TextButton(onPressed: () {
              Navigator.pop(context,true);
            }, child: Text("OK"))
          ],
        ),);
  }
}
