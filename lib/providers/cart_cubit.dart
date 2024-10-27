import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learn_go_router/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]) {
    _loadCart();
  }

  void _loadCart() {
    final box = Hive.box<Product>('cart');
    final products = List<Product>.from(box.values);
    emit(products);
  }

  void addProduct(Product product) {
    final box = Hive.box<Product>('cart');
    box.put(product.id, product);
    emit(List<Product>.from(state)..add(product));
  }

  void removeProduct(Product product) {
    final box = Hive.box<Product>('cart');
    box.delete(product.id);
    emit(List<Product>.from(state)..removeWhere((p) => p.id == product.id));
  }
}
