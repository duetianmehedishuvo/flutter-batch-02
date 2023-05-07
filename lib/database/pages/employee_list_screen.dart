import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/database/helpers/database_helper.dart';
import 'package:hello_world/database/models/employee_models.dart';
import 'package:hello_world/database/pages/add_employee_screens.dart';
import 'package:hello_world/database/widgets/employee_widget.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEmployeeScreen())).then((value) {
                  if (value == 1) {
                    setState(() {});
                  } else if (value == null) {}
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: DatabaseHelper.getAllEmployeeInformation(),
        builder: (context, AsyncSnapshot<List<EmployeeModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CupertinoActivityIndicator();
          } else {
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEmployeeScreen()));
                    },
                    child: Text('Add New Employee'),
                  ),
                  Text('No Data Available')
                ],
              ));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return EmployeeWidget(snapshot.data![index]);
                });
          }
        },
      ),
    );
  }
}
