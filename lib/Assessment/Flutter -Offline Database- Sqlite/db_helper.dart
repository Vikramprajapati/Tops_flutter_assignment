import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tops_flutter_assignment/Assessment/Flutter%20-Offline%20Database-%20Sqlite/model.dart';

class DbHelper {
  //singleTone
  DbHelper._();

  static final DbHelper instance = DbHelper._();

  Database? database;
  final tablename = "student";
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
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            // CREATE ALL TABLE HERE
            //"CREATE TABLE $tablename($idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$nameColumn TEXT ,$designationColumn TEXT)");
            "CREATE TABLE $tablename( $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$firstNameColumn TEXT NOT NULL,$lastNameColumn TEXT NOT NULL,$emailColumn TEXT NOT NULL,$courseColumn TEXT NOT NULL,$addressColumn TEXT,$pincodeColumn TEXT,$cityColumn TEXT,$feesColumn REAL,number TEXT,$marksColumn INTEGER)");
      },
    );
  }

  //CRUD OPERATION
//1. READ OPERATION
  Future<List<Map<String, Object?>>> getAllStudent() async {
    var db = await getDatabase();
    // List<Map<String, Object?>> result = await db.query(tablename);
    // return result;
    return await db.query(tablename);
  }

  //2. INSERT OPERATION
  Future<int> insertStudent(Student student) async {
    var db = await getDatabase();
    return await db.insert(tablename, student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//3. DELETE

  Future<int> deleteStudent(Student student) async {
    var db = await getDatabase();
    return await db
        .delete(tablename, where: "$idColumn=?", whereArgs: [student.id]);
  }

  //4. update

  Future<int> updateStudent(Student student) async {
    var db = await getDatabase();
    return await db.update(tablename, student.toMap(),
        where: "$idColumn=?", whereArgs: [student.id]);
  }
}
