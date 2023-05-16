import 'package:flutter/material.dart';
import 'package:hello_world/Provider/cart_provider.dart';
import 'package:hello_world/Provider/product_model.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(this.productModel,this.index, {Key? key}) : super(key: key);
  final ProductModel productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(productModel.name),
        trailing: IconButton(onPressed: (){
          Provider.of<CartProvider>(context,listen: false).removeProduct(index);
        },icon: Icon(Icons.delete),),
      ),
    );
  }
}
