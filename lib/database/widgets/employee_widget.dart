import 'package:flutter/material.dart';
import 'package:hello_world/database/helpers/database_helper.dart';
import 'package:hello_world/database/models/employee_models.dart';
import 'package:hello_world/database/pages/add_employee_screens.dart';
import 'package:hello_world/widgets/custom_message.dart';
import 'package:hello_world/widgets/custom_service.dart';
// Upgrade
class EmployeeWidget extends StatefulWidget {
  const EmployeeWidget(this.employeeModel, {Key? key}) : super(key: key);
  final EmployeeModel employeeModel;

  @override
  State<EmployeeWidget> createState() => _EmployeeWidgetState();
}

class _EmployeeWidgetState extends State<EmployeeWidget> {
  Future<bool> _showCustomDeleteConfirmationDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Delete ${widget.employeeModel.name} ?'),
              content: Text('Are you sure want to delete employee...'),
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('Cancel')),
                MaterialButton(
                    onPressed: () {
                      deleteEmployee();
                    },
                    child: Text('Delete')),
              ],
            ));

    return Future.value(false);
  }

  // void method default
  deleteEmployee() async {
    int status = await DatabaseHelper.deleteEmployee(widget.employeeModel.id!);
    if (status > 0) {
      showToastMessage('Deleted', isError: false);
      Navigator.of(context).pop(true);
      setState(() {});
    } else {
      showToastMessage('Deleted Failed');
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.employeeModel.id.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Icon(Icons.delete, color: Colors.white),
        padding: EdgeInsets.only(left: 10),
      ),
      confirmDismiss: (DismissDirection direction) {
        return _showCustomDeleteConfirmationDialog();
      },
      onDismissed: (direction) {
        deleteEmployee();
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
