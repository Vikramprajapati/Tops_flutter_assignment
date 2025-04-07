import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate=DateTime(1999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selected Date"),
            SizedBox(height: 10,),
            Text("${selectedDate?.day}-${selectedDate?.month}-${selectedDate?.year}"),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
              DateTime? date=await
              showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(2050));
              if(date!=null)
              setState(() {
                selectedDate=date;
              });
            }, child: Text("Show Date"))
          ],
        ),
      ),
    );
  }
}
