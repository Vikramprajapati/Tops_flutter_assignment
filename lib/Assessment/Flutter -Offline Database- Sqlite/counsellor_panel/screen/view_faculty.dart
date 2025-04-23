import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/model/faculty_model.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/screen/add_faculty.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db/db_helper.dart';

class ViewFaculty extends StatefulWidget {
  const ViewFaculty({super.key});

  @override
  State<ViewFaculty> createState() => _ViewFacultyState();
}

class _ViewFacultyState extends State<ViewFaculty> {
  DbHelper dbHelper = DbHelper.instance;
  late Future<List<Faculty>> faculty;

  Future<List<Faculty>> getFacultyData() async {
    await dbHelper.getDatabase();
    List<Map<String, Object?>> Facultymap = await dbHelper.getAllFaculty();
    return Facultymap.map((e) => Faculty.fromMap(e)).toList();
  }

  refreshFaculty() {
    setState(() {
      faculty = getFacultyData();
    });
  }

  @override
  void initState() {
    faculty = getFacultyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty Data"),
      ),
      body: FutureBuilder(
        future: faculty,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          List<Faculty> faculty = snapshot.data ?? [];

          if (faculty.isEmpty) {
            return Center(child: Text("No Faculty Found"));
          } else
            return ListView.builder(
              itemCount: faculty.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(faculty[index].name),
                  subtitle: Text(faculty[index].email),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == "edit") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFaculty(
                                      faculty: faculty[index],
                                    ))).then(
                          (value) {
                            if (value == true) {
                              refreshFaculty();
                            }
                          },
                        );
                      } else {
                        dbHelper.deleteFaculty(faculty[index]);
                        refreshFaculty();
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
            );
        },
      ),
    );
  }
}
