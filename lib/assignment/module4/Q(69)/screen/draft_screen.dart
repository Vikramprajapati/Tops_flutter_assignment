import 'package:flutter/material.dart';

class DraftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "Vikram",
      "Yashmala",
      "Dharmendra",
      "Yash",
      "Abhishek",
      "Vishal",
      "Vijay"
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Drafts",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
          ),
        ),
        body: ListView.separated(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Text(name[index][0]),
                  ),
                ),
                title: Text(
                  "Draft",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                subtitle: Text("I am ${name[index]}"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("12:00 PM"),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15,
            );
          },
        ));
  }
}
