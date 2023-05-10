const String tableEmployee = 'tbl_employee';
const String columnEmpId = 'column_emp_id';
const String columnEmpName = 'column_emp_name';
const String columnEmpAge = 'column_emp_age';
const String columnEmpPhone = 'column_emp_phone';


class EmployeeModel {
  int? id;
  String? name;
  String? phone;
  int? age;

  EmployeeModel({this.phone, this.name, this.id, this.age});


  // POST/ PUT

  // GET / DELETE

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnEmpName: name, columnEmpAge: age, columnEmpPhone: phone};
    // if (id != null) {
    //   map[columnEmpId] = id;
    // }
    return map;
  }

  EmployeeModel.fromMap(Map<String, dynamic> map) {
    id = map[columnEmpId];
    name = map[columnEmpName];
    phone = map[columnEmpPhone];
    age = map[columnEmpAge];
  }
}
