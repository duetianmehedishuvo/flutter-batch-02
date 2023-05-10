import 'package:flutter/material.dart';
import 'package:hello_world/database/helpers/database_helper.dart';
import 'package:hello_world/database/models/employee_models.dart';
import 'package:hello_world/widgets/custom_app_bar.dart';
import 'package:hello_world/widgets/custom_message.dart';
import 'package:hello_world/widgets/custom_text_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({this.isUpdated = false, this.employeeModel, Key? key}) : super(key: key);
  final bool isUpdated;
  final EmployeeModel? employeeModel;

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String text = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isUpdated == true) {
      nameController.text = widget.employeeModel!.name!;
      phoneController.text = widget.employeeModel!.phone!;
      ageController.text = widget.employeeModel!.age!.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: '${widget.isUpdated == true ? "Update" : "Add"} Employee Screen',
        height: 90,
      ),
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

                int value = 0;
                if (widget.isUpdated) {
                  employeeModel.id = widget.employeeModel!.id;
                  value = await DatabaseHelper.updateEmployee(employeeModel);
                } else {
                  value = await DatabaseHelper.insertEmployee(employeeModel);
                }

                if (value > 0) {
                  showToastMessage('Employee ${widget.isUpdated ? "Updated" : "Inserted"} successfully', isError: false);
                  Navigator.of(context).pop(1);
                } else {
                  showToastMessage('Data Insert failed');
                }
              }
            },
            child: Text('${widget.isUpdated == true ? 'Update' : "Submit"}', style: TextStyle(color: Colors.white, fontSize: 19)),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
