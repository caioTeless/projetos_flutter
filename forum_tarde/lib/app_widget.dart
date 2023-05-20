import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_tarde/core/config/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fórum',
      theme: kAppTheme,
      //initialRoute: Modular.initialRoute,
      initialRoute: '/login',
    ).modular();
  }
}
