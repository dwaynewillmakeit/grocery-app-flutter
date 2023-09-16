import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/screens/cart/cart_widget.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Cart (2)",
          color: color,
          fontSize: 22,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.delete),
            color: color,
          )
        ],
      ),
      body: Column(
        children: [
          _checkout(context: context),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext context}) {
    final color = Utils(context).color;
    final size = Utils(context).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "Order now",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
                child: TextWidget(
              text: "Total: \$ 0.259",
              color: color,
              fontSize: 18,
              isTitle: true,
            ))
          ],
        ),
      ),
    );
  }
}
