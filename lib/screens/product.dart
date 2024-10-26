import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go_router/data/dummy_data.dart';
import 'package:learn_go_router/models/product.dart';
import 'package:learn_go_router/providers/cart_cubit.dart';
import 'package:learn_go_router/routing/app_router.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return GestureDetector(
          onTap: () => context.goNamed(AppRoute.details.name, extra: product),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey.withOpacity(0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: product.image,
                  child: Image.asset(product.image, width: 60, height: 60),
                ),
                const SizedBox(height: 8),
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Remove Product'),
                                content: const Text(
                                    'Are you sure you want to remove this product from your cart?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      context
                                          .read<CartCubit>()
                                          .removeProduct(product);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(isInCart ? 'Remove' : 'Add'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
