import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/faq.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/moke_test.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/process.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/question_bank.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/rto_office.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/statictics.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/test_details.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/cube/traffic_signs.dart';

class RTO {
  IconData icon;
  String description;
  Function onTap;

  RTO({required this.icon, required this.description, required this.onTap});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RTO> rto = [
    RTO(
        icon: Icons.menu_book_rounded,
        description: "Test Details",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TestDetails()));
        }),
    RTO(
        icon: Icons.book,
        description: "Question Bank",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QustionBank()));
        }),
    RTO(
        icon: Icons.list_alt_outlined,
        description: "Traffic Signs",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TrafficSigns()));
        }),
    RTO(
        icon: Icons.computer,
        description: "Moke Test",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MokeTestScreens()));
        }),
    RTO(
        icon: Icons.home_work_outlined,
        description: "RTO Office",
        onTap: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RTOOfficeScreens()));
        }),
    RTO(
        icon: Icons.screen_rotation_alt,
        description: "Process",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProcessScreens()));
        }),
    RTO(
        icon: Icons.stacked_bar_chart,
        description: "Statistics",
        onTap: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const StatisticsScreens()));
        }),
    // RTO(icon: Icons.book, description: "Forms", onTap: (context){Navigator.push(context, MaterialPageRoute(builder: (context) => const FormsScreens()));}),
    RTO(
        icon: Icons.quora,
        description: "FAQ",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FAQScreens()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "RTO Driving License",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.dehaze,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10, // Horizontal spacing between items
            mainAxisSpacing: 10, // Vertical spacing between items
          ),
          itemCount: rto.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        rto[index].icon,
                        size: 50,
                      ),
                      Text(
                        rto[index].description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                rto[index]
                    .onTap(context); // Invoke the onTap function with context
              },
            );
          }),
    );
  }
}
