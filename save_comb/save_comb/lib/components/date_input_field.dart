import 'package:flutter/material.dart';
import 'package:save_comb/helpers/date_format_helper.dart';

class DateInputField extends StatefulWidget {
  
  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {

  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final DateHelper helper = DateHelper();

  @override
  void initState(){
    dateController = TextEditingController(text: helper.formatDate(selectedDate));
    super.initState();
  }

  void dispose() {
    super.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range_outlined),
        labelText: 'Date',
        labelStyle: TextStyle(color: Colors.black),
      ),
      readOnly: true,
      onTap: () => _selectedDate(context),
      controller: dateController,
    );
  }

  Future<void> _selectedDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected;
        dateController.text = helper.formatDate(selected);
      });
    }
  }
}
