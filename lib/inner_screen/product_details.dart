import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/heat_button.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/ProductDetails';

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _quantityTextController = TextEditingController(text: "1");

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
            size: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: FancyShimmerImage(
              imageUrl:
                  'https://cdn.britannica.com/24/174524-050-A851D3F2/Oranges.jpg',
              width: size.width,
              boxFit: BoxFit.fill,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "text",
                          color: color,
                          fontSize: 28,
                          isTitle: true,
                        ),
                        const HeartButton()
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      children: [
                        const TextWidget(
                          text: '\$2.59',
                          color: Colors.green,
                          fontSize: 22,
                          isTitle: true,
                        ),
                        TextWidget(text: '/Kg', color: color, fontSize: 12),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: true,
                          child: Text(
                            "\$3.9",
                            style: TextStyle(
                                fontSize: 15,
                                color: color,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(63, 200, 101, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const TextWidget(
                            text: "Free Delivery",
                            color: Colors.white,
                            fontSize: 20,
                            isTitle: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _quantityControllerWidget(
                            onTap: () {
                              setState(() {
                                if(_quantityTextController.text =='1'){
                                  return;
                                }
                                _quantityTextController.text = (int.parse(
                                    _quantityTextController.text) -
                                    1)
                                    .toString();
                              });
                            },
                            icon: CupertinoIcons.minus,
                            color: Colors.red),
                        Flexible(
                            flex: 1,
                            child: TextField(
                              controller: _quantityTextController,
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    _quantityTextController.text = "1";
                                  } else {
                                    return;
                                  }
                                });
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                            )),
                        _quantityControllerWidget(
                            onTap: () {
                              setState(() {

                                _quantityTextController.text = (int.parse(
                                    _quantityTextController.text) +
                                    1)
                                    .toString();
                              });
                            },
                            icon: CupertinoIcons.plus,
                            color: Colors.green),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: size.width,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal:  30, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Total",
                                color: Colors.red.shade300,
                                fontSize: 20,
                                isTitle: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                                Row(

                                children: [
                                  const TextWidget(
                                    text: "\$2.59/",
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  TextWidget(
                                    text: "${_quantityTextController.text}Kg",
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),

                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){},
                            child: Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: TextWidget(
                                  text: "Add to cart",
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityControllerWidget(
      {required Function onTap, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              onTap();
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
