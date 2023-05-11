import 'package:flutter/material.dart';
import 'package:hello_world/Provider/product_provider.dart';
import 'package:provider/provider.dart';

class IncrementScreen extends StatelessWidget {
  const IncrementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${Provider.of<ProductProvider>(context, listen: true).i}',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ProductProvider>(context, listen: false).increment();
          },
          child: Icon(Icons.add)),
    );
  }
}
