import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.controller, this.inputType = TextInputType.text, this.hintText = '', Key? key}) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText, border: OutlineInputBorder()),
      keyboardType: inputType,
    );
  }
}
