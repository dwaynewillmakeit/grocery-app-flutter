import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/screens/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CartWidget();
        },
        itemCount: 10,
      ),
    );
  }
}
