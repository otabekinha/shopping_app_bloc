import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_go_router/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void addProduct(Product product) {
    emit([...state, product]);
  }

  void removeProduct(Product product) {
    emit(state.where((item) => item.id != product.id).toList());
  }
}
