import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/provider/dark_theme_provider.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/on_sale_widget.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

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
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size screenSize = utils.getScreenSize;
    return Scaffold(
      body: Column(
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
            onPressed: () {},
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
                    SizedBox(width: 5,),
                    Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              SizedBox(width: 8,),
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
          )
        ],
      ),
    );
  }
}
