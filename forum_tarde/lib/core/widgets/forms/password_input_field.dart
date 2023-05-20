import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String?)? onSaved;
  final String Function(String?)? validator;

  const PasswordInputField({
    Key? key,
    this.label = 'Senha',
    required this.initialValue,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  const PasswordInputField.confirm({
    Key? key,
    this.label = 'Confirmar senha',
    required this.initialValue,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isHidden = true;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: IconButton(
            icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggleVisibility,
          ),
        ),
        obscureText: _isHidden,
        controller: _controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
