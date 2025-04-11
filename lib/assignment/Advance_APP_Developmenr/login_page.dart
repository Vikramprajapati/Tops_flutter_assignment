import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/forgot_password.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/home_screen.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

login(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // Navigate to home screen
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  } on FirebaseAuthException catch (e) {
    String errorMessage = "Invalid credential";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
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
                          login(_emailController.text.toString(),
                              _passwordController.text.toString(), context);
                        }
                      },
                      child: Text("Login")),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: Text(
                        " Forgot Password?",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ));
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )),
        ));
  }
}
