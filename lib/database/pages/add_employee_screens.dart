import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/contact_db.dart';
import 'package:hello_world/contact_model.dart';
import 'package:hello_world/database/helpers/database_helper.dart';
import 'package:hello_world/database/models/employee_models.dart';
import 'package:hello_world/widgets/custom_app_bar.dart';
import 'package:hello_world/widgets/custom_message.dart';
import 'package:hello_world/widgets/custom_text_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String text = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'Add Contact Screen'),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CustomTextField(controller: nameController, hintText: 'Enter  Name'),
          SizedBox(height: 20),
          CustomTextField(controller: phoneController, hintText: 'Enter  Phone', inputType: TextInputType.phone),
          SizedBox(height: 20),
          CustomTextField(controller: ageController, hintText: 'Enter  Age', inputType: TextInputType.number),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () async {
              if (nameController.text.isEmpty) {
                showToastMessage('Name fields is required');
              } else if (phoneController.text.isEmpty) {
                showToastMessage('Phone fields is required');
              } else if (ageController.text.isEmpty) {
                showToastMessage('Age fields is required');
              } else {
                EmployeeModel employeeModel =
                    EmployeeModel(phone: phoneController.text, name: nameController.text, age: int.parse(ageController.text));
                int value = await DatabaseHelper.insertEmployee(employeeModel);

                print(value);
              }
            },
            child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 19)),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
