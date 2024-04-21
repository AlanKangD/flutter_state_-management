import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pectice/3-provider/state/provider_cart.dart';
import 'package:provider_pectice/common/product.dart';
import 'package:provider_pectice/common/product_tile.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Provider 를 사용하기 위해 아래의 코드 둘다 가능하다.
    //context.watch<ProviderCart>();
    ProviderCart providerCart = context.watch();

    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: providerCart.cartProductList.contains(product),
            onPressed: providerCart.onProductPressed,
          );
        },
      ),
    );
  }
}
