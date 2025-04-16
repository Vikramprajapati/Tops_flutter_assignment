import 'package:flutter/material.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/db_helper.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/model.dart';

class AddStudent extends StatefulWidget {
  Student? student;

  AddStudent({this.student});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _feesController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();

  String? _selectedCourse;
  String? _selectedCity;

  final List<String> _courses = ['Flutter', 'Python', 'Java', 'Full Stack'];
  final List<String> _cities = ['Surat', 'Ahmedabad', 'Rajkot', 'Vadodara'];

  DbHelper dbHelper = DbHelper.instance;

  @override
  void initState() {
    widget.student != null
        ? _firstNameController.text = widget.student!.firstName.toString()
        : "";
    widget.student != null
        ? _lastNameController.text = widget.student!.lastName.toString()
        : "";
    widget.student != null
        ? _emailController.text = widget.student!.email.toString()
        : "";
    widget.student != null
        ? _addressController.text = widget.student!.address.toString()
        : "";
    widget.student != null
        ? _pincodeController.text = widget.student!.pincode.toString()
        : "";
    widget.student != null
        ? _contactController.text = widget.student!.number.toString()
        : "";
    widget.student != null
        ? _feesController.text = widget.student!.fees.toString()
        : "";
    widget.student != null
        ? _marksController.text = widget.student!.marks.toString()
        : "";
    widget.student != null ? _selectedCity = widget.student!.city : null;
    widget.student != null ? _selectedCourse = widget.student!.course : null;
    super.initState();
  }

  saveData() async {
    var firstName = _firstNameController.text.toString();
    var lastName = _lastNameController.text.toString();
    var email = _emailController.text.toString();
    var address = _addressController.text.toString();
    var pincode = _pincodeController.text.toString();
    var number = _contactController.text.toString();
    var fees = double.tryParse(_feesController.text.toString());
    var marks = int.tryParse(_marksController.text.toString());
    var course = _selectedCourse;
    var city = _selectedCity;

    await dbHelper.insertStudent(Student(
        firstName: firstName,
        lastName: lastName,
        email: email,
        course: course!,
        address: address,
        pincode: pincode,
        city: city!,
        fees: fees,
        number: number,
        marks: marks));
    Navigator.pop(context, true);
  }

  updateStudent() async {
    var firstName = _firstNameController.text.toString();
    var lastName = _lastNameController.text.toString();
    var email = _emailController.text.toString();
    var address = _addressController.text.toString();
    var pincode = _pincodeController.text.toString();
    var number = _contactController.text.toString();
    var fees = double.tryParse(_feesController.text.toString());
    var marks = int.tryParse(_marksController.text.toString());
    var course = _selectedCourse;
    var city = _selectedCity;
    await dbHelper.updateStudent(Student(
        id: widget.student!.id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        course: course!,
        address: address,
        pincode: pincode,
        city: city!,
        fees: fees,
        number: number,
        marks: marks));
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Enter a valid first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Course',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  items: _courses.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _selectedCourse,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCourse = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a course' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _pincodeController,
                  decoration: InputDecoration(
                      labelText: 'Pincode',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  items: _cities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _selectedCity,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a city' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _feesController,
                  decoration: InputDecoration(
                      labelText: 'Total Fees',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null ||
                        value.length != 10 ||
                        int.tryParse(value) == null) {
                      return 'Enter a valid 10-digit contact number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _marksController,
                  decoration: InputDecoration(
                      labelText: 'Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.student == null ? saveData() : updateStudent();
                  },
                  child: Text(widget.student != null
                      ? 'Update Student'
                      : "Add Student"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
