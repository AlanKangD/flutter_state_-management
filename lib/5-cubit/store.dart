import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_pectice/5-cubit/state/cart_cubit.dart';
import 'package:provider_pectice/common/product.dart';
import 'package:provider_pectice/common/product_tile.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = context.watch();
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartCubit.state.contains(product),
            onPressed: cartCubit.onProductPressed,
          );
        },
      ),
    );
  }
}
