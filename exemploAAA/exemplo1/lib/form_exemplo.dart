import 'package:exemplo1/db_helper.dart';
import 'package:exemplo1/exemplo_model.dart';
import 'package:exemplo1/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormExemplo extends StatefulWidget {
  @override
  _FormExemploState createState() => _FormExemploState();
}

class _FormExemploState extends State<FormExemplo> {
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final dbHelper = DbHelper();
  String date = '';
  String name = '';
  double value = 0.0;

  Future _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
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
        title: Text('Second page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(hintText: 'Date'),
              readOnly: true,
              onTap: () => _selectDate(context),
              onSaved: (val) => date = val!,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
              onSaved: (val) => name = val!,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Number',
              ),
              onSaved: (val) => value = double.parse(val!),
            ),
            ElevatedButton(
              child: Text('Press'),
              onPressed: _onSave,
            ),
          ],
        ),
      ),
    );
  }

  Future _onSave() async {
    _formKey.currentState!.save();
    final data = ExemploModel(date: date, name: name, number: value);
    print('${data.date} - ${data.name} - ${data.number}');
    if (data.id == null) {
      await dbHelper.create(data);
      print('success');
    } else {
      await dbHelper.update(data);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
