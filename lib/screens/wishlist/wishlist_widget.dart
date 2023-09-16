import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/inner_screen/product_details.dart';
import 'package:grocery_flutter_app/sevices/global_methods.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/heat_button.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;
    final size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ProductDetailsScreen.routeName);
          },
          child: Container(
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: color, width: 1),
                borderRadius: BorderRadius.circular(9)),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: size.width * 0.2,
                  height: size.width * .25,
                  child: FancyShimmerImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUncCydoU454cQR5avJTqyn72yZRJ1CzPVxg&usqp=CAU',
                    boxFit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                IconlyLight.bag2,
                                color: color,
                              )),
                          HeartButton()
                        ],
                      ),
                    ),
                    Flexible(
                        child: TextWidget(
                      text: "Title",
                      color: color,
                      fontSize: 20,
                      maxLines: 2,
                      isTitle: true,
                    )),
                     const SizedBox(height: 5,),
                     TextWidget(
                      text: "\$2.59",
                      color: color,
                      fontSize: 20,
                      maxLines: 2,
                      isTitle: true,)

                  ],
                )
              ],
            ),
          )),
    );
  }
}
