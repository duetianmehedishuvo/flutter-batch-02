import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  int i = 0;

  void increment({bool isIncrement = true}) {
    if (i >= 0) {
      isIncrement
          ? i++
          : i != 0
              ? i--
              : 0;
      notifyListeners();
    }

    print(i);
  }
}
