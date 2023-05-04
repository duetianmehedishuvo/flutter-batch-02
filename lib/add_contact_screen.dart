import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/contact_db.dart';
import 'package:hello_world/contact_model.dart';
import 'package:hello_world/widgets/custom_app_bar.dart';
import 'package:hello_world/widgets/custom_message.dart';
import 'package:hello_world/widgets/custom_text_field.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String text = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'Add Contact Screen'),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CustomTextField(controller: nameController, hintText: 'Enter Contact Name'),
          SizedBox(height: 20),
          CustomTextField(controller: phoneController, hintText: 'Enter Contact Phone', inputType: TextInputType.phone),
          SizedBox(height: 20),
          CustomTextField(controller: emailController, hintText: 'Enter Contact Email', inputType: TextInputType.emailAddress),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                showToastMessage('Name fields is required');
              } else if (phoneController.text.isEmpty) {
                showToastMessage('Phone fields is required');
              } else if (emailController.text.isEmpty) {
                showToastMessage('Email fields is required');
              } else {
                // ContactDB.contacts.add(ContactModel(name: nameController.text, phone: phoneController.text, email: emailController.text));
                ContactDB contactDB=ContactDB();
                contactDB.addContactData(ContactModel(name: nameController.text, phone: phoneController.text, email: emailController.text));

                showToastMessage('Data Insert Successfully', isError: false);
                nameController.clear();
                phoneController.clear();
                emailController.clear();
                Navigator.of(context).pop();
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
