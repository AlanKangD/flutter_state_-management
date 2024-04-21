import 'package:flutter/material.dart';
import 'package:provider_pectice/1-stateful_wigget/cart.dart';
import 'package:provider_pectice/1-stateful_wigget/store.dart';
import 'package:provider_pectice/common/bottom_bar.dart';
import 'package:provider_pectice/common/product.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  // 선택 된 cartList 구현
  List<Product> cardProductList = [];

  // 메인에서 cart List 에 값을 체워줄 function 새로이 만듬
  void onPressed(product) {
    setState(() {
      if (cardProductList.contains(product)) {
        cardProductList.remove(product);
      } else {
        cardProductList.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          /// Store
          Store(
            cartProductList: cardProductList,
            onPressed: onPressed,
          ),

          /// Cart
          Cart(
            cartProductList: cardProductList,
            onPressed: onPressed,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: "${cardProductList.length}",
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
