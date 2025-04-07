import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/offline_DB_Assignment/add_edit_employee.dart';
import 'package:tops_flutter_assignment/offline_DB_Assignment/db_helper.dart';
import 'package:tops_flutter_assignment/offline_DB_Assignment/model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Employee>> employees;

  DbHelper dbHelper = DbHelper.instance;

  Future<List<Employee>> getEmployees() async {
    await dbHelper.getDatabase();
    List<Map<String, Object?>> Employeemap = await dbHelper.getAllEmp();
    return Employeemap.map((e) => Employee.fromMap(e)).toList();
  }

  @override
  void initState() {
    employees = getEmployees();
    super.initState();
  }

  void refreshEmployees() {
    setState(() {
      employees = getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          List<Employee> employees = snapshot.data ?? [];

          if (employees.isEmpty) {
            return Center(child: Text("No Employee Found"));
          } else
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(employees[index].name),
                  subtitle: Text(employees[index].designation),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == "edit") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEmployeeScreen(
                                  employee: employees[index],
                                )
                            )).then((value) {
                          if(value==true){
                            refreshEmployees();
                          }
                        },);
                      } else {
                        dbHelper.deleteEmp(employees[index]);
                        refreshEmployees();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEmployeeScreen(),
              )).then(
                (value) {
              if (value == true) {
                refreshEmployees();
              }
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
