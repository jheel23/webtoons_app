import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();
  ThemeData theme = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
  );
}
