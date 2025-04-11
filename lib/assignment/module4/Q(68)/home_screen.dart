import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> person = [
    {"name": "Vikram", "Age": 20, "salary": 25000, "address": "Jalore"},
    {"name": "Yashmala", "Age": 25, "salary": 25000, "address": "Jalore"},
    {"name": "Dharmendra", "Age": 22, "salary": 25000, "address": "Jalore"},
    {"name": "Abhishek", "Age": 20, "salary": 25000, "address": "Jalore"},
    {"name": "Vishal", "Age": 27, "salary": 25000, "address": "Jalore"},
    {"name": "Ajay", "Age": 26, "salary": 25000, "address": "Jalore"},
    {"name": "Virat", "Age": 21, "salary": 25000, "address": "Jalore"},
    {"name": "Mahendra", "Age": 25, "salary": 25000, "address": "Jalore"},
    {"name": "Prakash", "Age": 24, "salary": 25000, "address": "Jalore"},
    {"name": "Pooja", "Age": 24, "salary": 25000, "address": "Jalore"},
    {"name": "Nisha", "Age": 20, "salary": 25000, "address": "Jalore"},
    {"name": "Karthik", "Age": 20, "salary": 25000, "address": "Jalore"},
    {"name": "Yash", "Age": 20, "salary": 25000, "address": "Jalore"},
    {"name": "Rahul", "Age": 21, "salary": 35000, "address": "Jaipur"},
    {"name": "Lokesh", "Age": 22, "salary": 45000, "address": "Jodhpur"},
    {"name": "Rajiv", "Age": 23, "salary": 55000, "address": "Ajmer"},
    {"name": "Vijay", "Age": 24, "salary": 65000, "address": "Sirohi"}
  ];

  _showContextmenu(BuildContext context, int index) {
    showBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              title: Text("VIEW"),
              leading: Icon(Icons.visibility),
              onTap: () => _viewDetails(person[index])),
          ListTile(
              title: Text("EDIT"),
              leading: Icon(Icons.edit),
              onTap: () => _edit(person[index])),
          ListTile(
            title: Text("DELETE"),
            leading: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onTap: () {
              setState(() {
                person.removeAt(index);
              });
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context Menu"),
      ),
      body: ListView.builder(
        itemCount: person.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () => _showContextmenu(context, index),
          child: ListTile(
            title: Text(person[index]["name"]),
            leading: Icon(Icons.person),
          ),
        ),
      ),
    );
  }

  _viewDetails(Map<String, dynamic> person) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Person Information"),
        content: Text(
            " Name:  ${person["name"]}\n Age:  ${person["Age"]}\n salary:  ${person["salary"]}\n address:  ${person["address"]}"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("CLOSE"))
        ],
      ),
    );
  }

  _edit(Map<String, dynamic> person) {
    final _nameController = TextEditingController(text: person["name"]);
    final _ageController =
        TextEditingController(text: person["Age"].toString());
    final _salaryController =
        TextEditingController(text: person["salary"].toString());
    final _addressController = TextEditingController(text: person["address"]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Person Information"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  person["name"] = _nameController.text.toString();
                  person["Age"] = _ageController.text.toString();
                  person["salary"] = _salaryController.text.toString();
                  person["address"] = _addressController.text.toString();
                });
              },
              child: Text("Update"))
        ],
      ),
    );
  }
}
