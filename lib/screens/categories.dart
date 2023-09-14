import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/categories_widget.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

 final List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'categoryName': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'categoryName': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'categoryName': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'categoryName': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'categoryName': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'categoryName': 'Grains',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);

    Color color = utils.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Categories",
          color: color,
          fontSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              categoryText: catInfo[index]['categoryName'],
              imagePath: catInfo[index]['imgPath'],
              color: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
