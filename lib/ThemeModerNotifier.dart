import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ScreenLightState.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class ThemeModeNotifier extends ChangeNotifier {

  ThemeMode _themeMode;

  ThemeModeNotifier(SharedPreferences preferences) {
    _init();
  }

  ThemeMode get mode => _themeMode;

  void _init() async {
    _themeMode = await loadThemeMode();
    notifyListeners();
  }

  void update(ThemeMode nextMode) {
    _themeMode = nextMode;
    saveThemeMode(nextMode);
    notifyListeners();
  }
}