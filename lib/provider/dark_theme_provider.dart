import 'package:flutter/cupertino.dart';
import '../services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  // We add change Notifier so as to tell it to keep listening to the changes
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme {
    return _darkTheme;
  }

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
