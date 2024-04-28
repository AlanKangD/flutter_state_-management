import 'package:flutter/material.dart';
import 'package:provider_pectice/6-bloc/cart.dart';
import 'package:provider_pectice/6-bloc/store.dart';
import 'package:provider_pectice/common/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          /// Store
          Store(),

          /// Cart
          Cart(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: "0",
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
