import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();


  String? gender;


  String? _errName,
      _errEmail,
      _errContact,
      _errPassword,
      _errCourse,
      _errConPassword;
  String? course = null;

  List<String> courses = ["Java", "Flutter", "android", "Python"];

  String _nameRegex = r'^[A-Za-z\s]+$';
  String _emailRegex = r'^[A-Za-z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  String _passwordRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[/@$#\.][^\s]).{8,16}$';

  void _updateGenderValue(String? selection) {
    setState(() {
      gender = selection!;
    });
  }

  void _validateForm() {
    _errName=ValidateName(_nameController.text.trim());
    _errEmail=ValidateEmail(_emailController.text.trim());
    _errContact=ValidateContact(_contactController.text.trim());
    _errPassword=ValidatePassword(_passwordController.text.trim());

    if(_errName==null &&
        _errPassword==null &&
        _errEmail==null &&
        _errContact==null
    ){
      print('All done!');
    }


  }
  String? ValidateName(String name) {
    if(name.isEmpty){
      return "Enter Name";
    }
    else if(!RegExp(_nameRegex).hasMatch(name))
    {
      return "Invalid Password";
    }
    else {
      return null;
    }
  }

  String? ValidateEmail(String email) {
    if(email.isEmpty){
      return "Enter email";

    }
    else if(!RegExp(_emailRegex).hasMatch(email))
    {
      return "Invalid email";
    }
    else return null;
  }

  String? ValidateContact(String contact) {
    if(contact.length!=10)
    {
      return "Enter valid Number";
    }
    else {
      return null;
    }

  }

  String? ValidatePassword(String password) {
    if(password.isEmpty){
      return "Enter password";
    }
    else if(!RegExp(_passwordRegex).hasMatch(password)){
      return "Invalid Password";
    }

    else return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Registretion"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Student Name",
                    errorText: _errName,
                    border: OutlineInputBorder(
                      //  borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    errorText: _errEmail,
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    labelText: "Contact Number",
                    errorText: _errContact,
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 10,),
      
                Row(
      
                  children: [
                    Text("Gender"),
                    SizedBox(width: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (value) {
                            _updateGenderValue(value);
                          },),
                        Text("Male"),
                      ],
                    ),
                    SizedBox(width: 40,),
                    Row(
                      children: [
                        Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (value) {
                            _updateGenderValue(value);
                          },),
                        Text("Female"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
      
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Course",
                    border: OutlineInputBorder(),
                    errorText: _errCourse,
                  ),
                  items: List.generate(
                    courses.length,
                        (index) =>
                        DropdownMenuItem(
                          child: Text("${courses[index]}"),
                          value: courses[index],
                        ),
      
                  ),
                  onChanged: (value) {
                    setState(() {
                      course = value;
                    });
                  },),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      helperText: "(must contain atleast one uppercase, lowercase,digit",
                      border: OutlineInputBorder(),
                      errorText: _errPassword
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _cPasswordController,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    errorText: _errConPassword,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: FilledButton(onPressed: () {
                    _validateForm();
                  }, child: Text("Register")),
                )
      
      
              ],
            ),
          ),
        ),
      ),
    );
  }


}
