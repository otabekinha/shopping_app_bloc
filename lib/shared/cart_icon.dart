import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go_router/models/product.dart';
import 'package:learn_go_router/providers/cart_cubit.dart';
import 'package:learn_go_router/routing/app_router.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.goNamed(AppRoute.cart.name);
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: BlocBuilder<CartCubit, List<Product>>(
              builder: (context, state) {
                return Text(state.length.toString());
              },
            ),
          ),
        ),
      ],
    );
  }
}
