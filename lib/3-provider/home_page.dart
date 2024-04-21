import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pectice/3-provider/cart.dart';
import 'package:provider_pectice/3-provider/state/provider_cart.dart';
import 'package:provider_pectice/3-provider/store.dart';
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
    return MultiProvider(
      // Scaffold 의 부모 위젯으로 Provider 를 등록 시켜야
      // Store() 와 Cart() 를 자식 위젯으로 사용가능하다.
      providers: [
        ChangeNotifierProvider(
          // MultProvider를 사용하기 위해서는 필수로 providers 를 구현해야함
          create: (context) => ProviderCart(),
        ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
