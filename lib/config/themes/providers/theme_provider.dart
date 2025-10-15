import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() {
  return ThemeNotifier();
});
class ThemeNotifier extends Notifier<ThemeMode>{
  @override
  build() {
    return ThemeMode.light;
  }
  final ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {

    // _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

  }
}