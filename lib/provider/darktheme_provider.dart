import 'package:flutter/material.dart';
import 'package:grocery/services/darktheme_pref.dart';

class DarkThemeProvider with ChangeNotifier{
  DarkThemePref darkThemePref = DarkThemePref();
  bool _darkTheme=false;
  bool get getDarkTheme=> _darkTheme;
  
  set setDarkTheme(bool value){
    _darkTheme=false;
    darkThemePref.setDarkThemePref(value);
    notifyListeners();
  }
}