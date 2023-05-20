import 'package:flutter/material.dart';
import 'package:save_comb/helpers/app_routes.dart';
import 'package:save_comb/pages/home_page.dart';
import 'package:save_comb/pages/register_comb_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salvar abastecimento',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        AppRoute.HOME: (ctx) => HomePage(),
        AppRoute.REGISTER_PAGE: (ctx) => RegisterComb(),
      },
    );
  }
}
