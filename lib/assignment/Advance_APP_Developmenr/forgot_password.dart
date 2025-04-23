import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/login_page.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  void forgotPassword(String email, BuildContext context) async {
    //this code does not check email is exit or not in firebase authentication
    await _auth.sendPasswordResetEmail(email: email).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "We have send you mail to recover  password, please check email.",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red),
        );
      },
    ).onError(
      (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text(error.toString(), style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red),
        );
      },
    );

    // try {
    //   // Check if the user exists in Firebase Authentication
    //   List<String> signInMethods =
    //       await _auth.fetchSignInMethodsForEmail(email);
    //   if (signInMethods.isNotEmpty) {
    //     // User exists, send password reset email
    //     await _auth.sendPasswordResetEmail(email: email).then(
    //       (value) {
    //         Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => LoginPage(),
    //             ));
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //               content:
    //                   Text("Password reset email sent! Check your inbox.")),
    //         );
    //       },
    //     );
    //   } else {
    //     // User does not exist
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("No account found for this email.")),
    //     );
    //   }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Error: ${e.toString()}")),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    forgotPassword(_emailController.text.toString(), context);
                  }
                },
                child: Text("Forgot Password"))
          ]),
        ),
      ),
    );
  }
}
