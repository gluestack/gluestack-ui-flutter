import 'package:flutter/material.dart';

enum GSThemeMode { light, dark }

///
/// Theme provider. It is used to manage theme for Gluestack UI widgets.
///
class ThemeProvider with ChangeNotifier {
  GSThemeMode _currentTheme = GSThemeMode.light;

  GSThemeMode get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme == GSThemeMode.light) {
      _currentTheme = GSThemeMode.dark;
    } else {
      _currentTheme = GSThemeMode.light;
    }
    notifyListeners();
  }

  void setTheme(GSThemeMode mode) {
    _currentTheme = mode;
    notifyListeners();
  }

  ThemeData getThemeData() {
    switch (_currentTheme) {
      case GSThemeMode.light:
        return ThemeData.light();
      case GSThemeMode.dark:
        return ThemeData.dark();
      default:
        return ThemeData.light();
    }
  }
}
