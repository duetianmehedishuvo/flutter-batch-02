import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/utils/custome_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.controller, this.inputType = TextInputType.text, this.hintText = '', this.onChanged, Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;

  // TextFormField
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        controller: controller,
        style: rajdhaniMedium500,
        decoration:
            InputDecoration(hintText: hintText, border: OutlineInputBorder(), fillColor: Colors.white, hintStyle: rajdhaniRegular400,),
        keyboardType: inputType,
        onChanged: onChanged,
      ),
    );
  }
}
