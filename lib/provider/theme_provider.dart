import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeMode themeMode = ThemeMode.light;

  static bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme =
      ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 51, 51, 50));

  static final lightTheme = ThemeData(scaffoldBackgroundColor: Colors.white);
}
