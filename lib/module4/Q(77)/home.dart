import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  makeCall(String phoneNumber) async {
    Uri phoneUri = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw "Could not launch $phoneUri";
    }
  }

  sendSMS(phoneNumber, message) async {
    Uri smsUri = Uri(
        scheme: 'sms', path: phoneNumber, queryParameters: {"body": message});
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw "Could not launch $smsUri ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Launcher"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  makeCall("8769788575");
                },
                child: Text("Make a call")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  sendSMS("+1-555-123-4567", "Hello brother");
                },
                child: Text("Send a Msg")),
          ],
        ),
      ),
    );
  }
}
