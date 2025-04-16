import 'package:flutter/material.dart';

class QustionBank extends StatelessWidget {
  const QustionBank({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> qustionBank = [
      {
        'qustion' : "Near a pedestrian crossing, when the pedestrians are waiting to cross the road, you should",
        'answer' : "Stop the vehicle and wait till the pedestrians cross the road and then proceed",
      },
      {
        'qustion' : "You are approaching a narrow bridge, another vehicle is about to enter the bridge from opposite side, you should",
        'answer' : "Wait till the other vehicle crosses the bridge and then proceed",
      },
      {
        'qustion' : "When a vehicle is involved in an accident causing injury to any person",
        'answer' : "Take all reasonable steps to secure medical attention to the injured and report to the nearest police station within 24",
      },
      {
        'qustion' : "On a road designated as one way",
        'answer' : "Should not drive in reverse gear",
      },
      {
        'qustion' : "You can overtake a vehicle in front",
        'answer' : "From the right side of that vehicle",
      },
      {
        'qustion' : "When a vehicle approaches an unguarded railway level crossing, before crossing it, the driver shall",
        'answer' : "Stop the vehicle on the left side of the road, get down from the vehicle, go to the railway track, and ensure that no train or trolley is coming from either side",
      },
      {
        'qustion' : "Validity of learner's licence",
        'answer' : "6 months from the date of issue",
      },
      {
        'qustion' : "In a road without footpath, the pedestrians",
        'answer' : "Should walk on the right side of the road",
      },
      {
        'qustion' : "Free passage should be given to the following types of vehicles",
        'answer' : "Ambulance and fire service vehicles",
      },
      {
        'qustion' : "When a vehicle is parked on the road side during night",
        'answer' : "The parking light shall remain lit",
      },
      {
        'qustion' : "Fog lamps are used",
        'answer' : "When there is fog",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Question Bank",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: qustionBank.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text.rich(
                      TextSpan(
                        text: "Q ${index+1} : ${qustionBank[index]['qustion']}\n",
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "A : ${qustionBank[index]['answer']}",
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal)
                          )
                        ],
                      )
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}