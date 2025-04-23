import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/model/faculty_model.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/counsellor_panel/model/student_model.dart';

class DbHelper {
  //singleTone
  DbHelper._();

  static final DbHelper instance = DbHelper._();

  Database? database;
  final studentTablename = "student";
  final facultyTablename = "faculty";
  final idColumn = "id";
  final firstNameColumn = "firstname";
  final lastNameColumn = "lastname";
  final emailColumn = "email";
  final courseColumn = "course";
  final addressColumn = "address";
  final pincodeColumn = "pincode";
  final cityColumn = "city";
  final feesColumn = "fees";
  final numberColumn = "number";
  final marksColumn = "marks";

  Future<Database> getDatabase() async {
    if (database != null) {
      return database!;
    } else {
      database = await openDB();
      return database!;
    }
  }

  Future<Database> openDB() async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, "student.db");
    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $studentTablename( $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$firstNameColumn TEXT NOT NULL,$lastNameColumn TEXT NOT NULL,$emailColumn TEXT NOT NULL,$courseColumn TEXT NOT NULL,$addressColumn TEXT,$pincodeColumn TEXT,$cityColumn TEXT,$feesColumn REAL,number TEXT,$marksColumn INTEGER,faculty TEXT)");
        await db.execute('''
      CREATE TABLE $facultyTablename (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT,
        password TEXT
      )
    ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db
              .execute("ALTER TABLE $studentTablename ADD COLUMN faculty TEXT");
        }
      },
    );
  }

  //CRUD OPERATION
//1. READ OPERATION
  Future<List<Map<String, Object?>>> getAllStudent() async {
    var db = await getDatabase();
    // List<Map<String, Object?>> result = await db.query(tablename);
    // return result;
    return await db.query(studentTablename);
  }

  Future<List<Map<String, Object?>>> getMyStudent(String faculty) async {
    var db = await getDatabase();
    // List<Map<String, Object?>> result = await db.query(tablename);
    // return result;
    return await db
        .query(studentTablename, where: "faculty=?", whereArgs: [faculty]);
  }

  Future<List<Map<String, dynamic>>> getAllFaculty() async {
    var db = await getDatabase();
    return await db.query(facultyTablename);
  }

  //2. INSERT OPERATION
  Future<int> insertStudent(Student student) async {
    var db = await getDatabase();
    return await db.insert(studentTablename, student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertFaculty(Faculty faculty) async {
    var db = await getDatabase();
    return await db.insert(facultyTablename, faculty.toMap());
  }

//3. DELETE

  Future<int> deleteStudent(Student student) async {
    var db = await getDatabase();
    return await db.delete(studentTablename,
        where: "$idColumn=?", whereArgs: [student.id]);
  }

  Future<int> deleteFaculty(Faculty faculty) async {
    var db = await getDatabase();
    return await db.delete(facultyTablename,
        where: "$idColumn=?", whereArgs: [faculty.id]);
  }

  //4. update

  Future<int> updateStudent(Student student) async {
    var db = await getDatabase();
    return await db.update(studentTablename, student.toMap(),
        where: "$idColumn=?", whereArgs: [student.id]);
  }

  Future<int> updateFaculty(Faculty faculty) async {
    var db = await getDatabase();
    return await db.update(facultyTablename, faculty.toMap(),
        where: "$idColumn=?", whereArgs: [faculty.id]);
  }

  Future<List<Map<String, Object?>>> getSpecificStudent(int id) async {
    var db = await getDatabase();
    return await db.query(studentTablename, where: "id=?", whereArgs: [id]);
  }

  //login faculty
  Future<bool> facultyLogin(String email, String password) async {
    var db = await getDatabase();
    var result = await db.query(facultyTablename,
        where: "email=? AND password=?", whereArgs: [email, password]);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
