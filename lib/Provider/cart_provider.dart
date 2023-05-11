import 'package:flutter/foundation.dart';
import 'package:hello_world/Provider/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> products = [];

  void addProduct(ProductModel p) {
    products.add(p);
    notifyListeners();
  }

  void removeAllProduct() {
    products.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var element in products) {
      total += element.price;
    }
    return total;
  }

  int get itemCount=>products.length;
}
