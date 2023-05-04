import 'package:hello_world/database/models/employee_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DatabaseHelper {
  static const String createTableEmp = '''CREATE TABLE $tableEmployee( 
  $columnEmpId integer primary key autoincrement, 
  $columnEmpName text not null, 
  $columnEmpPhone text not null,
  $columnEmpAge integer not null );''';

  static Future<Database> open() async {
    final dbPath = await getDatabasesPath();
    final aPath = Path.join(dbPath, 'employeee.db');

    return openDatabase(aPath, version: 1, onCreate: (db, version) async {
      await db.execute(createTableEmp);
    });
  }

  static Future<int> insertEmployee(EmployeeModel employeeModel) async {
    Database db = await open();
    return db.insert(tableEmployee, employeeModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // select
  static Future<List<EmployeeModel>> getAllEmployees() async {
    Database db = await open();
    final List<Map<String, dynamic>> map = await db.query(tableEmployee, orderBy: columnEmpName);
    List<EmployeeModel> allEmployees = [];
    for (var element in map) {
      allEmployees.add(EmployeeModel.fromMap(element));
    }
    return allEmployees;
  }
}
