import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/Provider/cart_provider.dart';
import 'package:hello_world/Provider/product_model.dart';
import 'package:hello_world/contact_db.dart';
import 'package:hello_world/contact_model.dart';
import 'package:hello_world/widgets/custom_app_bar.dart';
import 'package:hello_world/widgets/custom_message.dart';
import 'package:hello_world/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Center(child: Text('Add Product')),
          Divider(thickness: 4,color: Colors.red),
          CustomTextField(controller: nameController, hintText: 'Enter Product Name'),
          SizedBox(height: 20),
          CustomTextField(controller: priceController, hintText: 'Enter Price', inputType: TextInputType.number),
          SizedBox(height: 20),
          CustomTextField(controller: quantityController, hintText: 'Enter Quantity', inputType: TextInputType.number),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                showToastMessage('Name fields is required');
              } else if (priceController.text.isEmpty) {
                showToastMessage('Phone fields is required');
              } else if (quantityController.text.isEmpty) {
                showToastMessage('Email fields is required');
              } else {
                ProductModel p = ProductModel(
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  quantity: int.parse(quantityController.text)
                );

                Provider.of<CartProvider>(context,listen: false).addProduct(p);

                showToastMessage('Data Insert Successfully', isError: false);
                nameController.clear();
                priceController.clear();
                quantityController.clear();
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
