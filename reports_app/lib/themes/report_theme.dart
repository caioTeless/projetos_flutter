
import 'package:flutter/material.dart';

final themeReportApp = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
  buttonTheme: ButtonThemeData(
    height: 40,
    textTheme: ButtonTextTheme.primary,
  ),
);