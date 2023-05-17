import 'package:flutter/material.dart';
import 'package:hello_world/widgets/custom_message.dart';

class TextFormFieldscreen extends StatelessWidget {
  TextFormFieldscreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
              validator: (value) => value!.isEmpty ? 'Email cannot be blank' : null,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your Age',
              ),

              validator: (value) => value!.isEmpty ? 'Email cannot be blank' : null,
            ),
            MaterialButton(
              onPressed: () {

                if (!_formKey.currentState!.validate()) {
                  showToastMessage('Error');
                } else {
                  _formKey.currentState!.save();
                  showToastMessage('No Error');
                }
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
