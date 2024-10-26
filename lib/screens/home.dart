import 'package:flutter/material.dart';
import 'package:learn_go_router/screens/product.dart';
import 'package:learn_go_router/shared/cart_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        title: const Text('Products'),
        centerTitle: false,
        actions: const [CartIcon()],
      ),
      body: const ProductScreen(),
    );
  }
}
