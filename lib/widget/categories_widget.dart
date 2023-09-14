import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/provider/dark_theme_provider.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.categoryText,
      required this.imagePath,
      required this.color});

  final String categoryText, imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color textColor = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.fill)),
            ),
            TextWidget(
              text: categoryText,
              color: textColor,
              fontSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
