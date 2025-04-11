import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> cities = [
    "Jaipur",
    "Jodhpur",
    "Ajmer",
    "Sirohi",
  ];

  String selectedCity="";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected City:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(selectedCity),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Select One City"),
                        content: Container(
                          height: cities.length * 50,
                          child: ListView.builder(
                              itemCount: cities.length,
                              itemBuilder: (context, index) => TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCity=cities[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(cities[index]))),
                        ),
                      );
                    },
                  );
                },
                child: Text("Show Alert Dialog")),
          ],
        ),
      ),
    );
  }
}
