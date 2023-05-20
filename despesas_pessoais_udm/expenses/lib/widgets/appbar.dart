import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarAlternative extends StatelessWidget {
  static Text text = Text('Personal expenses');
  final List<Widget> actions;

  const AppBarAlternative({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: text,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ))
        : AppBar(
            title: text,
            centerTitle: true,
            actions: actions,
          );
  }
}
