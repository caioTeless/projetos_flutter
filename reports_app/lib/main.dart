import 'package:flutter/material.dart';
import 'package:reports_app/themes/report_theme.dart';
import 'package:reports_app/view/report_home_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  
  Widget build(BuildContext contexnt){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reports',
      theme: themeReportApp,
      home: ReportHomePage(),
    );
  }
}