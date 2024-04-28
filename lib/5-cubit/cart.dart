import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_pectice/5-cubit/state/cart_cubit.dart';
import 'package:provider_pectice/common/product.dart';
import 'package:provider_pectice/common/product_tile.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> cartProductList = context.watch<CartCubit>().state;

    return Scaffold(
      body: cartProductList.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: context.read<CartCubit>().onProductPressed,
                );
              },
            ),
    );
  }
}