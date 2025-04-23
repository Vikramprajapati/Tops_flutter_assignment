import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/screen/Dashboard.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db/db_helper.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/faculty_panel/faculty_dashboard.dart';

class Login extends StatefulWidget {
  bool isCounsellor;

  Login({required this.isCounsellor});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  DbHelper dbHelper = DbHelper.instance;

  loginFaculty() async {
    await dbHelper
        .facultyLogin(_email.text.toString(), _password.text.toString())
        .then(
      (value) {
        if (value == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FacultyDashboard(
                  faculty_id: _email.text.toString(),
                ),
              ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Invalid Credentials"),
            backgroundColor: Colors.red.withOpacity(0.6),
          ));
        }
      },
    );
  }

  loginCounsellor() async {
    String email = _email.text.toString();
    String password = _password.text.toString();

    if (email == "admin123@gmail.com" && password == "admin123") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid Credentials"),
        backgroundColor: Colors.red.withOpacity(0.6),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      widget.isCounsellor ? loginCounsellor() : loginFaculty();
                    }
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
