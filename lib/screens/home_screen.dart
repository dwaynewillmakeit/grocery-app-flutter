import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_flutter_app/sevices/global_methods.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/feed_items.dart';
import 'package:grocery_flutter_app/widget/on_sale_widget.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);

    final Color color = Utils(context).color;

    Size screenSize = utils.getScreenSize;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.33,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: const TextWidget(
                text: "View All",
                maxLines: 1,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On sale".toUpperCase(),
                        color: Colors.red,
                        fontSize: 22,
                        isTitle: true,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: screenSize.height * 0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return OnSaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Our Product",
                    color: color,
                    fontSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const TextWidget(
                      text: "Browse All",
                      maxLines: 1,
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: screenSize.width / (screenSize.height * 0.55),
              children: List.generate(4, (index) => FeedsWidget()),
            )
          ],
        ),
      ),
    );
  }
}
