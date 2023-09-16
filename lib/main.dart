import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/consts/theme_data.dart';
import 'package:grocery_flutter_app/inner_screen/feed_screen.dart';
import 'package:grocery_flutter_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_flutter_app/inner_screen/product_details.dart';
import 'package:grocery_flutter_app/provider/dark_theme_provider.dart';
import 'package:grocery_flutter_app/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme = await themeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBarScreen(),
          routes: {
            OnSaleScreen.routeName: (context) => OnSaleScreen(),
            FeedScreen.routeName: (context) => FeedScreen(),
            ProductDetailsScreen.routeName: (context) => ProductDetailsScreen()
          },
        );
      }),
    );
  }
}
