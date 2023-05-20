import 'package:flutter/material.dart';

class FormScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final EdgeInsets padding;
  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  const FormScaffold({
    Key? key,
    this.appBar,
    this.padding = const EdgeInsets.all(20),
    required this.children,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: padding,
        child: Form(
          key: formKey,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
