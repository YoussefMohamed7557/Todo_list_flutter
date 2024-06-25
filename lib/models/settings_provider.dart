import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String language_code = "en";
  ThemeMode themeMode = ThemeMode.light;

  AppProvider() {
    _loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language_code = prefs.getString('language_code') ?? "en";
    themeMode = ThemeMode.values[prefs.getInt('theme_mode') ?? 0];
    notifyListeners();
  }

  void changeLanguageCode(String langCode) async {
    language_code = langCode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', langCode);
  }

  void changeThemeMode(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);
  }
}