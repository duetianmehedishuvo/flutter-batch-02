import 'package:flutter/material.dart';
import 'package:hello_world/Provider/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(this.productModel, {Key? key}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(productModel.name),
      ),
    );
  }
}
