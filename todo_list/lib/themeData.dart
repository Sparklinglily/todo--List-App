import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeColors {
  static const Color background = Color.fromARGB(255, 32, 32, 32);

  static const Color primaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryText = Color.fromARGB(255, 151, 144, 144);
}

class ThemeProvider with ChangeNotifier {
  ThemeMode? _themeMode = ThemeMode.system;

  ThemeMode? get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme;
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final isDarkTheme = prefs.getBool('isDarkTheme');

    final Brightness systemBrightness = ui.window.platformBrightness;
    _themeMode = isDarkTheme == true
        ? ThemeMode.dark
        : isDarkTheme == false
            ? ThemeMode.light
            : systemBrightness == ui.Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light;
    notifyListeners();
  }

  Future<void> switchTheme(ThemeMode? selectedTheme) async {
    if (selectedTheme == ThemeMode.system) {
      _themeMode = ThemeMode.system;
      notifyListeners();
    } else {
      _themeMode = selectedTheme;
      notifyListeners();
    }

    if (selectedTheme != ThemeMode.system) {
      final prefs = await SharedPreferences.getInstance();

      prefs.setBool('isDarkTheme', _themeMode == ThemeMode.dark);
      notifyListeners();
    }
  }

  ThemeData getThemeData() {
    if (themeMode == ThemeMode.dark) {
      return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.white,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: DarkThemeColors.secondaryText,
            ),
          ));
    } else {
      return ThemeData.light();
    }
  }
}
