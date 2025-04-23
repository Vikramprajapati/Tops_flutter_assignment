class Student {
  int? id;
  String firstName;
  String lastName;
  String email;
  String course;
  String? address;
  String? pincode;
  String? city;
  double? fees;
  String? number;
  int? marks;
  String? faculty;

  Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.course,
    this.address,
    this.pincode,
    this.city,
    this.fees,
    this.number,
    this.marks,
     this.faculty
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['firstname'] ?? '',
      lastName: map['lastname'] ?? '',
      email: map['email'] ?? '',
      course: map['course'] ?? '',
      address: map['address'],
      pincode: map['pincode'],
      city: map['city'],
      fees: map['fees'] != null ? (map['fees'] as num).toDouble() : null,
      number: map['number'],
      marks: map['marks'],
      faculty: map['faculty'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'course': course,
      'address': address,
      'pincode': pincode,
      'city': city,
      'fees': fees,
      'number': number,
      'marks': marks,
      'faculty':faculty
    };
  }
}
