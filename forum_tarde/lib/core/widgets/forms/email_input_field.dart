import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String?)? onSaved;
  final String Function(String?)? validator;

  const EmailInputField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSaved,
    this.validator,
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
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
