import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tops_flutter_assignment/assignment/Advance_APP_Developmenr/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> posts = [];

  fetchData() async {
    String uri = "https://jsonplaceholder.typicode.com/posts";
    try {
      var response = await http.get(Uri.parse(uri));
      var data = jsonDecode(response.body);
      setState(() {
        posts = data;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home PAge"),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                  );
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("${posts[index]["id"]}"),
                ),
                title: Text(posts[index]["title"]),
                subtitle: Text(
                  posts[index]["body"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ));
  }
}
