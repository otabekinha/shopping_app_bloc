import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_go_router/models/product.dart';
import 'package:learn_go_router/providers/cart_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: product.image,
                child: Image.asset(product.image, height: 200),
              ),
              const SizedBox(height: 16),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                product.desc.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '\$${product.price}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              BlocBuilder<CartCubit, List<Product>>(
                builder: (context, cartItems) {
                  final isInCart = cartItems.contains(product);
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 26,
                      ),
                      minimumSize: const Size(0, 0),
                    ),
                    onPressed: () {
                      if (!isInCart) {
                        context.read<CartCubit>().addProduct(product);
                      } else {
                        context.read<CartCubit>().removeProduct(product);
                      }
                    },
                    child: Text(isInCart ? 'Remove' : 'Add'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
