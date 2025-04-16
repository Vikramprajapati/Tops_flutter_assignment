import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/data/test_data.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter_Advance_App_Development/home_page.dart';

class MokeTestScreens extends StatelessWidget {
  const MokeTestScreens({super.key});

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width * 0.9;
    double hSize = 50;
    double gap = 12;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Moke Test",
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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Introduction",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(thickness: 3),
                ),
                const Text(
                  "Subject like Rules and Regulations of traffic, and traffic signage's included in the test.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: gap),
                const Text(
                  "15 questions are asked in the test at random, out of which 11 questions are required to be answered correctly to pass the test.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: gap),
                const Text(
                  "48 seconds are allowed to answer each question.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(wSize, hSize),
                    backgroundColor: Colors.yellowAccent,
                    elevation: 3,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartTest()),
                    );
                  },
                  child: const Text(
                    "Start Test",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StartTest extends StatefulWidget {
  const StartTest({super.key});

  @override
  State<StartTest> createState() => _StartTestState();
}

class _StartTestState extends State<StartTest> {
  String? _selectedValue;
  int ans = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Moke Test",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
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
      body: i < 15 ? buildQuestionUI() : buildResultUI(),
    );
  }

  Widget buildQuestionUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(spreadRadius: 1, blurRadius: 1, color: Colors.white),
            ]),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "${i + 1} / 15",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  )),
                  const Divider(),
                  Text(
                    testData[i]['question'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const Divider(),
                  selectOptions(testData[i]['option1']),
                  selectOptions(testData[i]['option2']),
                  selectOptions(testData[i]['option3']),
                ],
              ),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(spreadRadius: 1, blurRadius: 1, color: Colors.white)
            ]),
            child: TextButton(
              onPressed: () {
                if (_selectedValue != null) {
                  setState(() {
                    if (_selectedValue! == testData[i]['answer']) {
                      ans++;
                    }
                    i++;
                    _selectedValue = null;
                  });
                }
              },
              child: const Text("Next ->"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResultUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              border:
                  (ans < 11) ? Border.all(color: Colors.red, width: 2) : null,
              boxShadow: const [
                BoxShadow(spreadRadius: 1, blurRadius: 1, color: Colors.white),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      "Moke Test Results",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                  ),
                ),
                Divider(
                  color: ans < 11 ? Colors.red : Colors.black,
                  thickness: 2,
                ),
                const SizedBox(height: 7),
                Text("  Correct Answer : $ans",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                const Divider(),
                Text("  Wrong Answer : ${15 - ans}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                Divider(
                  color: ans < 11 ? Colors.red : Colors.black,
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    ans < 11 ? "Fail" : "Pass",
                    style: TextStyle(
                      color: ans < 11 ? Colors.red : Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(spreadRadius: 1, blurRadius: 1, color: Colors.white),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text(
                "Go to Home",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RadioListTile<String> selectOptions(String ans) {
    return RadioListTile<String>(
      title: Text(ans),
      value: ans,
      groupValue: _selectedValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
      },
    );
  }
}
