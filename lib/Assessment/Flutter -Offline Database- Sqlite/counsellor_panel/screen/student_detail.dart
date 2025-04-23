import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/model/student_model.dart';

class StudentDetail extends StatefulWidget {
  final Student student;

  const StudentDetail({super.key, required this.student});

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.student.firstName + " " + widget.student.lastName} Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  subtitle: Text(
                      widget.student.firstName + " " + widget.student.lastName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Name",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.email,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  title: Text(
                    "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.course,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Course",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.address!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Address",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.pincode!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Pincode",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.city!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "City",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text("${widget.student.fees!}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Fees",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text(widget.student.number!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Number",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text("${widget.student.marks!}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Marks",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  subtitle: Text("${widget.student.faculty}",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  title: Text(
                    "Assigned Faculty",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
