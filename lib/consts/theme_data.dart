import 'package:flutter/material.dart';

class Styles {
  static ThemeData getTheme(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xff00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xff1a1f3c) : const Color(0xFFe8fdfd),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xff0a0d2c) : const Color(0xFFf2fdfd),
      canvasColor: isDarkTheme ? const Color(0xff000000) : Colors.grey[59],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
    );
  }
}
