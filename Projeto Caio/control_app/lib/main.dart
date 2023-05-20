import 'package:control_app/pages/home_page.dart';
import 'package:control_app/pages/register_data_form.dart';
import 'package:control_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.deepOrangeAccent,
        primaryColor: Colors.orange,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.REGISTER_DATA: (ctx) => RegisterFormData(),
      },
    );
  }
}
