class Faculty {
  int? id;
  String name;
  String email;
  String? password;

  Faculty({this.id, required this.name, required this.email, this.password});

  factory Faculty.fromMap(Map<String, dynamic> map) {
    return Faculty(
        name: map["name"],
        email: map["email"],
        id: map["id"],
        password: map["password"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "name":name,
      "id":id,
      "email":email,
      "password":password
    };
  }
}
