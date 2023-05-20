import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final String text;
  final Function(String?) onSaved;
  final Icon icon;

  NumberInputField({
    required this.text,
    required this.onSaved,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: icon,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onSaved: onSaved,
    );
  }
}
