import 'package:flutter/cupertino.dart';
import 'package:grocery_flutter_app/sevices/dark_theme_pref.dart';

class DarkThemeProvider with ChangeNotifier{

  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value){
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }


}