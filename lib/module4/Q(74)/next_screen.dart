import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
