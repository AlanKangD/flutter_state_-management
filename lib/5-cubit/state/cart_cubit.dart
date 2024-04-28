import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_pectice/common/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void onProductPressed(Product product) {
    if (state.contains(product)) {
      //state.remove(product);
      // emit(state);
      emit(state.where((element) => element != product).toList());
    } else {
      // state.add(product);
      //  emit(state);
      emit([...state, product]);
    }
  }
}
