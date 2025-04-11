import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(69)/screen/draft_screen.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(69)/screen/inbox_screen.dart';
import 'package:tops_flutter_assignment/assignment/module4/Q(69)/screen/sent_screen.dart';

class NavigationDrawerScreen extends StatelessWidget {
  Function onSelectedScreen;


  NavigationDrawerScreen({required this.onSelectedScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // to remove whitespace of header from top
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red.shade400),
            child: Center(
              child: Text(
                "G-mail Clone",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: Text("Inbox"),
            leading: Icon(Icons.inbox),
            onTap: () {
             onSelectedScreen(InboxScreen());
             Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Sent"),
            leading: Icon(Icons.send),
            onTap: () {
              onSelectedScreen(SentScreen());
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Draft"),
            leading: Icon(Icons.drafts),
            onTap: () {
              onSelectedScreen(DraftScreen());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
