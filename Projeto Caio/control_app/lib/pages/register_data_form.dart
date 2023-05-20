import 'package:control_app/controllers/form_controller.dart';
import 'package:control_app/data/data_helper_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterFormData extends StatefulWidget {
  @override
  _RegisterFormDataState createState() => _RegisterFormDataState();
}

class _RegisterFormDataState extends State<RegisterFormData> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _formController = FormController(DataHelperDb());
  String? date;
  double? liters;
  double? total;


  Future _selectDate(BuildContext context) async {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Form - control'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: 'Date',
                ),
                onSaved: (value) => date = value,
                readOnly: true,
                onTap: () => _selectDate(context),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Liters',
                ),
                onSaved: (value) => liters = double.parse(value!),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Total',
                ),
                onSaved: (value) => total = double.parse(value!) ,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              ElevatedButton(
                child: Text('Press to save'),
                onPressed: onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveController(){
    _formController.date = date;
    _formController.liters = liters;
    _formController.total  = total;
  }

  Future onSave() async {
    _formKey.currentState!.save();
    saveController();
    await _formController.save();
    print('success');
    print('${_formController.date} - ${_formController.liters} - ${_formController.total}');
    Navigator.of(context).pop();
  }
}
