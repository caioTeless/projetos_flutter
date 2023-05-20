import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String?)? onSaved;

  const TextInputField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
        initialValue: initialValue,
        onSaved: onSaved,
      ),
    );
  }
}
