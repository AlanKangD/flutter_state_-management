import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_pectice/common/product.dart';

final cartProvider = NotifierProvider<RiverpodCart, List<Product>>(() {
  return RiverpodCart();
});

class RiverpodCart extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return const [];
  }

  // 상품 클릭
  void onProductPressed(Product product) {
    if (state.contains(product)) {
      //state.remove(product);
      state.where((element) => element != product).toList();
    } else {
     // state.add(product);
      state = [...state, product];
    }
  }
}
