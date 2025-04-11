import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/home_screen.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  signUp() async {
    String _email = _emailController.text.toString();
    String _pass = _passwordController.text.toString();
   try {
      await _auth
          .createUserWithEmailAndPassword(email: _email, password: _pass)
          .then(
        (value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        },
      );
    } on FirebaseAuthException catch (e) {
     String errorMessage = "Registration failed!";

     if (e.code == 'email-already-in-use') {
       errorMessage = "This email is already registered!";
     } else if (e.code == 'weak-password') {
       errorMessage = "Password is too weak. Use at least 6 characters!";
     } else if (e.code == 'invalid-email') {
       errorMessage = "Invalid email format!";
     }

     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(errorMessage, style: TextStyle(color: Colors.white)),
       ),
     );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email field required";
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter E-mail"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password field required";
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUp();
                        }
                      },
                      child: Text("Sign Up")),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text("Already have an account?"))
                ],
              )),
        ));
  }
}
