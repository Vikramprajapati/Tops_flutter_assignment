import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tops_flutter_assignment/assignment/offline_DB_Assignment/model.dart';

class DbHelper {
  //singleTone
  DbHelper._();

  static final DbHelper instance = DbHelper._();

  Database? database;
  final tablename = "emp";
  final idColumn = "id";
  final nameColumn = "name";
  final designationColumn = "designation";

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
    final path = join(databasepath, "employee.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            // CREATE ALL TABLE HERE
            "CREATE TABLE $tablename($idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$nameColumn TEXT ,$designationColumn TEXT)");
      },
    );
  }

  //CRUD OPERATION
//1. READ OPERATION
  Future<List<Map<String, Object?>>> getAllEmp() async {
    var db = await getDatabase();
    // List<Map<String, Object?>> result = await db.query(tablename);
    // return result;
    return await db.query(tablename);
  }

  //2. INSERT OPERATION
  Future<int> insertEmp(Employee employee) async {
    var db = await getDatabase();
    return await db.insert(tablename, employee.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//3. DELETE

  Future<int> deleteEmp(Employee employee) async {
    var db = await getDatabase();
    return await db
        .delete(tablename, where: "$idColumn=?", whereArgs: [employee.id]);
  }

  //4. update

  Future<int> updateEmp(Employee employee) async {
    var db = await getDatabase();
    return await db.update(tablename, employee.toMap(),
        where: "$idColumn=?", whereArgs: [employee.id]);
  }
}
