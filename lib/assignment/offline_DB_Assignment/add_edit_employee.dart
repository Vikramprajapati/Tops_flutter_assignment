import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/offline_DB_Assignment/db_helper.dart';

import 'package:tops_flutter_assignment/assignment/offline_DB_Assignment/model.dart';

class AddEmployeeScreen extends StatefulWidget {
  // int? id;
  Employee? employee;

  AddEmployeeScreen({this.employee});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  GlobalKey<FormState> _key = GlobalKey();

  DbHelper dbHelper = DbHelper.instance;

  @override
  void initState() {
    widget.employee != null
        ? _nameController.text = widget.employee!.name.toString()
        : "";
    widget.employee != null
        ? _designationController.text = widget.employee!.designation.toString()
        : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.employee != null
            ? Text("Update Employee")
            : Text("Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter name";
                        } else
                          return null;
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Enter Employee name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter designation";
                        } else
                          return null;
                      },
                      controller: _designationController,
                      decoration: InputDecoration(
                          hintText: "Enter Employee Designation",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              var name = _nameController.text.toString();
                              var designation =
                                  _designationController.text.toString();

                              if (_key.currentState!.validate()) {
                                if (widget.employee != null) {
                                  await dbHelper.updateEmp(Employee(
                                      id: widget.employee!.id,
                                      name: name,
                                      designation: designation));
                                } else {
                                  await dbHelper.insertEmp(Employee(
                                      name: name, designation: designation));
                                }
                                Navigator.pop(context, true);
                              }
                            },
                            child: widget.employee != null
                                ? Text("Update")
                                : Text("ADD")),
                        ElevatedButton(
                            onPressed: () {
                              _nameController.text = "";
                              _designationController.text = "";
                              setState(() {
                                _focusNode.requestFocus();
                              });
                            },
                            child: Text("CLEAR")),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
