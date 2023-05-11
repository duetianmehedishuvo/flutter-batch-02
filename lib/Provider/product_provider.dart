import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  int i = 0;

  void increment() {
    i++;
    notifyListeners();
    print(i);
  }
}
