import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
     // useMaterial3: true,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
          //iconTheme: IconThemeData(color: isDarkTheme ? const Color(0xFF0a0d2c) : const Color.fromARGB(255, 50, 206, 206),),
      
    );
  }
}
