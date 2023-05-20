import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final String text;
  final Icon prefixIcon;
  final Icon sufixIcon;
  final Function(String?) onSaved;

  DateInputField({
    required this.text,
    required this.prefixIcon,
    required this.sufixIcon,
    required this.onSaved,
  });

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final _dateController = TextEditingController();

  void _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    ).then((selectedDate) {
      if (selectedDate != null) {
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      decoration: InputDecoration(
        hintText: widget.text,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.sufixIcon
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
      onSaved: widget.onSaved,
    );
  }
}
