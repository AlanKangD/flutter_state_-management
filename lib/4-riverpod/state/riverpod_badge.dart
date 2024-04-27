import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_pectice/4-riverpod/state/riverpod_cart.dart';
import 'package:provider_pectice/common/product.dart';

final badgeProvider = NotifierProvider<RiverpodBadge, int>(RiverpodBadge.new);

class RiverpodBadge extends Notifier<int> {
  @override
  int build() {
    List<Product> cartProductList = ref.watch(cartProvider);
    return cartProductList.length;
  }
}
