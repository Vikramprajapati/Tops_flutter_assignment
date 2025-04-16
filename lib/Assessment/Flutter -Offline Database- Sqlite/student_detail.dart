import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db_helper.dart';

class StudentDetail extends StatefulWidget {
  //String name;

  const StudentDetail({super.key});

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {

  DbHelper dbHelper=DbHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text(),
      ),
    );
  }
}
