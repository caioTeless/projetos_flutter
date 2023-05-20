import 'package:control_app/routes/app_routes.dart';
import 'package:control_app/views/home_view.dart';
import 'package:control_app/views/list_data.dart';
import 'package:control_app/views/register_fuel.dart';
import 'package:flutter/material.dart';

main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.cyanAccent,
        primaryColor: Colors.cyan,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomeView(),
        AppRoutes.REGISTER_FUEL: (ctx) => RegisterFuel(),
        AppRoutes.LIST_DATA: (ctx) => ListData(),
      }
    );
  }
}
