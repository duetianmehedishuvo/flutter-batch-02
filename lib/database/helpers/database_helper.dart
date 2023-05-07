import 'package:hello_world/database/models/employee_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DatabaseHelper {
  static const String createTableEmp = '''CREATE TABLE $tableEmployee ( 
  $columnEmpId integer primary key autoincrement , 
  $columnEmpName text not null , 
  $columnEmpPhone text not null ,
  $columnEmpAge integer not null ); ''';

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

  // future  async
  // stream  async*

  static Future<List<EmployeeModel>> getAllEmployeeInformation() async {
    Database db = await open();
    // select * from employee; where employeeid=10;
    // select name from eployee;
    List<EmployeeModel> allEmployees = [];
    List<Map<String, Object?>> allEmployeeData = await db.query(tableEmployee);
    allEmployeeData.forEach((element) {
      allEmployees.add(EmployeeModel.fromMap(element));
    });
    return allEmployees;
  }
}
