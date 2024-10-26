import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_go_router/models/product.dart';
import 'package:learn_go_router/providers/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, List<Product>>(
        builder: (context, cartItems) {
          final reversedCartItems = cartItems.reversed.toList();
          double totalPrice =
              cartItems.fold(0, (sum, item) => sum + item.price);
          if (cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: reversedCartItems.length,
                  itemBuilder: (context, index) {
                    final product = reversedCartItems[index];
                    return ListTile(
                      leading:
                          Image.asset(product.image, width: 50, height: 50),
                      title: Text(product.title),
                      subtitle: Text('\$${product.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          context.read<CartCubit>().removeProduct(product);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
