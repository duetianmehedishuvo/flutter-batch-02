import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBarMessage(BuildContext context, String title, {bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title), backgroundColor: isError ? Colors.red : Colors.green));
}

void showToastMessage(String title, {bool isError = true, ToastGravity toastGravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
