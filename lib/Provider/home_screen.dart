import 'package:flutter/material.dart';
import 'package:hello_world/Provider/add_product_screen.dart';
import 'package:hello_world/Provider/cart_provider.dart';
import 'package:hello_world/Provider/product_item_widget.dart';
import 'package:hello_world/Provider/product_provider.dart';
import 'package:hello_world/helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => AddProductScreen());
  }

  // FORM  TextField  DUE TEXTFORMFIELD
  // STACK

  // GET , POST, PUT, DELETE
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          // Scaffold.of(context).openDrawer();
          _key.currentState!.openDrawer();
        }, icon: Icon(Icons.account_balance_sharp, color: Colors.white)),
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
      bottomNavigationBar: customBottomNavigation(context),
      drawer: customDrawerWidget(context),
      body: Consumer2<CartProvider, ProductProvider>(
        builder: (context, cartProvider, productProvider, child) {
          if (cartProvider.itemCount == 0) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
              itemCount: cartProvider.itemCount,
              itemBuilder: (context, index) {
                return ProductItemWidget(cartProvider.products[index], index);
              });
        },
      ),
    );
  }

  Widget customDrawerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      width: getScreenWidth(context) * 0.6,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        children: [
          Text('No data available'),
          Text('No data available'),
          Text('No data available'),
          Text('No data available'),
          Text('No data available'),
          Text('No data available'),
          Text('No data available'),
        ],
      ),
    );
  }

  Container customBottomNavigation(BuildContext context) {
    return Container(
      height: 50,
      decoration:
          BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('0', style: TextStyle(color: Colors.white, fontSize: 20)),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white, size: 30),
                    Positioned(
                        top: -6,
                        right: -5,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text(Provider.of<CartProvider>(context).itemCount.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false).increment(isIncrement: false);
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.white)),
                Text('${Provider.of<ProductProvider>(context).i}', style: TextStyle(color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false).increment();
                    },
                    icon: Icon(Icons.add_circle, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
