import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/on_sale_widget.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";

  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils(context).getScreenSize;
    final color = Utils(context).color;
    bool isEmpty = false;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Product on sale",
          fontSize: 22,
          color: color,
          isTitle: true,
        ),
      ),
      body: isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/box.png'),
                    Text(
                      "No product on sale at the moment",
                      style: TextStyle(
                        color: color,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: screenSize.width / (screenSize.height * 0.45),
              children: List.generate(16, (index) => OnSaleWidget()),
            ),
    );
  }
}
