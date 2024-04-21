import 'package:flutter/material.dart';
import 'package:provider_pectice/3-provider/state/provider_cart.dart';

class ProviderBadge with ChangeNotifier {
  ProviderBadge({
    required this.providerCart,
  }) {
    providerCart.addListener(providerCartListener);
  }

  int counter = 0;
  final ProviderCart providerCart;

  void providerCartListener() {
    counter = providerCart.cartProductList.length;
    print("object  : $counter");
    notifyListeners();
  }

  @override
  void dispose() {
    providerCart.removeListener(providerCartListener);
    super.dispose();
  }
}
