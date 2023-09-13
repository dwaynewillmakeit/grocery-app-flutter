import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/provider/dark_theme_provider.dart';
import 'package:grocery_flutter_app/screens/cart.dart';
import 'package:grocery_flutter_app/screens/categories.dart';
import 'package:grocery_flutter_app/screens/home_screen.dart';
import 'package:grocery_flutter_app/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {"page":const HomeScreen(),'title': 'Home Screen'},
    {"page":const CategoriesScreen(),'title': 'Categories Screen'},
    {"page":const CartScreen(),'title': 'Cart Screen'},
    {"page":const UserScreen(),'title': 'User Screen'},

  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark? Theme.of(context).cardColor:Colors.white ,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: !isDark? Colors.black12: Colors.white10 ,
        selectedItemColor: !isDark? Colors.black87: Colors.lightBlue.shade200,
        onTap: _selectedPage,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex==0?IconlyBold.home:IconlyLight.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex==1?IconlyBold.category:IconlyLight.category),
            label: "Categories"
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex==2?IconlyBold.buy:IconlyLight.buy),
            label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex==3?IconlyBold.user2:IconlyLight.user2),
              label: "User"
          ),
        ],
      ),
    );
  }
}
