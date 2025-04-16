import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/add_student.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db_helper.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/model.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/student_detail.dart';

class ViewStudents extends StatefulWidget {
  ViewStudents({Key? key}) : super(key: key);

  @override
  State<ViewStudents> createState() => ViewStudentsState();
}

class ViewStudentsState extends State<ViewStudents> {
  late Future<List<Student>> students;
  DbHelper dbHelper = DbHelper.instance;

  Future<List<Student>> getStudents() async {
    await dbHelper.getDatabase();
    List<Map<String, Object?>> Studentmap = await dbHelper.getAllStudent();
    return Studentmap.map((e) => Student.fromMap(e)).toList();
  }

  @override
  void initState() {
    students = getStudents();
    super.initState();
  }

  void refreshStudents() {
    setState(() {
      students = getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Data"),
      ),
      body: FutureBuilder(
        future: students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          List<Student> students = snapshot.data ?? [];

          if (students.isEmpty) {
            return Center(child: Text("No Employee Found"));
          } else
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetail()));
                },
                child: Card(

                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(students[index].firstName),
                    subtitle: Text(students[index].lastName),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == "edit") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddStudent(
                                        student: students[index],
                                      ))).then(
                            (value) {
                              if (value == true) {
                                refreshStudents();
                              }
                            },
                          );
                        } else {
                          dbHelper.deleteStudent(students[index]);
                          refreshStudents();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "edit",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.edit,
                              ),
                              Text("Edit"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "delete",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text("Delete"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
