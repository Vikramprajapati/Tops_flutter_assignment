import 'package:flutter/material.dart';

class TestDetails extends StatelessWidget {
  const TestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    String mcqTest = '''15 questions are asked in the test at random, out of which 11 questions are required to be answered correctly to pass the test. 48 seconds are allowed to answer each question.''';
    String drivingLicenceTest = '''In India, you are typically allowed three attempts to pass the driving test. If you do not pass the test after three attempts, you may need to restart the licensing process.''';
    String eligibilityOfDrivingLicenceinGujarat = '''To apply for a two-wheeler gearless vehicle DL, a person needs to be 16 years of age or above.
To apply for a geared motor vehicle DL, a person needs to be 18 years of age or above.
To apply for a heavy transport motor vehicle DL, a person needs to be 20 years of age or above.''';    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Test Details",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,size: 26,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("MCQ Test :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,top: 3),
                      child: Text(mcqTest),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Driving License Test :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,top: 3),
                      child: Text(drivingLicenceTest),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Eligibility for Driving Licence in Gujarat :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,top: 3),
                      child: Text(eligibilityOfDrivingLicenceinGujarat),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}