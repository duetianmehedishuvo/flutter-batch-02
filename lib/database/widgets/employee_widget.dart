import 'package:flutter/material.dart';
import 'package:hello_world/database/models/employee_models.dart';
import 'package:hello_world/database/pages/add_employee_screens.dart';
import 'package:hello_world/widgets/custom_service.dart';

class EmployeeWidget extends StatefulWidget {
  const EmployeeWidget(this.employeeModel, {Key? key}) : super(key: key);
  final EmployeeModel employeeModel;

  @override
  State<EmployeeWidget> createState() => _EmployeeWidgetState();
}

class _EmployeeWidgetState extends State<EmployeeWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.employeeModel.name!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  makePhoneCall(widget.employeeModel.phone!);
                },
                child: Text(widget.employeeModel.phone!)),
          ],
        ),
        trailing: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AddEmployeeScreen(isUpdated: true, employeeModel: widget.employeeModel)))
                      .then((value) {
                    if (value == 1) {
                      setState(() {});
                    } else if (value == null) {}
                  });
                },
                icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
