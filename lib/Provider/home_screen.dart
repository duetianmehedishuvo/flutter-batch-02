import 'package:flutter/material.dart';
import 'package:hello_world/Provider/add_product_screen.dart';
import 'package:hello_world/Provider/cart_provider.dart';
import 'package:hello_world/Provider/product_item_widget.dart';
import 'package:hello_world/Provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context)=>AddProductScreen());
  }


  // FORM  TextField  DUE TEXTFORMFIELD
  // STACK

  // GET , POST, PUT, DELETE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                _showModalBottomSheet(context);
                // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddProductScreen()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer2<CartProvider, ProductProvider>(
        builder: (context, cartProvider, productProvider, child) {
          if (cartProvider.itemCount == 0) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
              itemCount: cartProvider.itemCount,
              itemBuilder: (context, index) {
                return ProductItemWidget(cartProvider.products[index]);
              });
        },
      ),
    );
  }
}
