import 'package:flutter/material.dart';
import 'package:provider_pectice/common/product.dart';

class ProviderCart with ChangeNotifier {
  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    if (cartProductList.contains(product)) {
      cartProductList.remove(product);
    } else {
      cartProductList.add(product);
    }
    notifyListeners();
  }
}
