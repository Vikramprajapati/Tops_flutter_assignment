import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Call App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDialogShown = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      _showPermissionDialog();
      await prefs.setBool('isFirstTime', false);
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Phone Call Permission'),
        content: Text('Allow this app to make phone calls?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Deny'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _requestCallPermission();
            },
            child: Text('Allow'),
          ),
        ],
      ),
    );
  }



  Future<void> _requestCallPermission() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission Granted")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission Denied")),
      );
    }
  }

  void makePhoneCall(String phoneNumber) async {

    if (await Permission.phone.isGranted) {
      if (await canLaunchUrl(Uri.parse("tel:+91$phoneNumber"))) {
        await launchUrl(Uri.parse("tel:+91$phoneNumber"));
      } else {
        throw 'Could not launch $phoneNumber';
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Phone call permission not granted")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Call App")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            makePhoneCall("8769788575");
          },
          child: Text("Make Phone Call"),
        ),
      ),
    );
  }
}
