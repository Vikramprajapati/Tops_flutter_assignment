import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/model/faculty_model.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/screen/Dashboard.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db/db_helper.dart';

class AddFaculty extends StatefulWidget {
  Faculty? faculty;

  AddFaculty({super.key, this.faculty});

  @override
  State<AddFaculty> createState() => _AddFacultyState();
}

class _AddFacultyState extends State<AddFaculty> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  DbHelper dbHelper = DbHelper.instance;

  saveFaculty() async {
    String name = _nameController.text.toString();
    String password = _passController.text.toString();
    String email = _emailController.text.toString();
    await dbHelper
        .insertFaculty(Faculty(name: name, email: email, password: password));
    Navigator.pop(context, true);
  }

  updateFaculty() async {
    String name = _nameController.text.toString();
    String password = _passController.text.toString();
    String email = _emailController.text.toString();

    await dbHelper.updateFaculty(Faculty(
        name: name, email: email, password: password, id: widget.faculty!.id));
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    _nameController.text =
        widget.faculty == null ? "" : widget.faculty!.name.toString();
    _emailController.text =
        widget.faculty == null ? "" : widget.faculty!.email.toString();
    _passController.text =
        widget.faculty == null ? "" : widget.faculty!.password.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Faculty"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name field is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.faculty == null ? saveFaculty() : updateFaculty();
                    }
                  },
                  child: Text(widget.faculty != null
                      ? 'Update Faculty'
                      : "Add Faculty"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
