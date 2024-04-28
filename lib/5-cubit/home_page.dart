import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_pectice/5-cubit/cart.dart';
import 'package:provider_pectice/5-cubit/state/badge_cubit.dart';
import 'package:provider_pectice/5-cubit/state/cart_cubit.dart';
import 'package:provider_pectice/5-cubit/store.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => BadgeCubit(cartCubit: context.read()),
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
        bottomNavigationBar: BlocBuilder<BadgeCubit, int>(
          builder: (context, state) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: "$state",
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
