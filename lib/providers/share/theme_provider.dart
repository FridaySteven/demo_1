import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool isSwitched = false;

  void _switchThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  void onChangeTheme(bool value) {
    _switchThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    isSwitched = value;

    notifyListeners();
  }
}
