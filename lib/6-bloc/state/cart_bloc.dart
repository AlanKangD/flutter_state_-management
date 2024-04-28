import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_pectice/common/product.dart';

@immutable
abstract class CartEvent {
  const CartEvent();
} // 추상화 된 클래스 (인터페이스)

class onProductPressed extends CartEvent {
  final Product product;

  const onProductPressed(this.product);
}

class CartBloc extends Bloc<CartEvent, List<Product>> {
  CartBloc() : super(const []) {
    on<onProductPressed>((event, emit) {
      if (state.contains(event.product)) {
        // state.remove(event.product);
        // emit(state);
        emit(state.where((element) => element != event.product).toList());
      } else {
        // state.add(event.product);
        // emit(state);
        emit([...state, event.product]);
      }
    });
  }
}
