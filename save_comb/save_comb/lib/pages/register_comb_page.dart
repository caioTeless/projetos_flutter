import 'dart:math';
import 'package:flutter/material.dart';
import 'package:save_comb/components/app_bar.dart';
import 'package:save_comb/components/date_input_field.dart';
import 'package:save_comb/components/number_input_field.dart';
import 'package:save_comb/model/save_comb.dart';

class RegisterComb extends StatefulWidget {

  @override
  _RegisterCombState createState() => _RegisterCombState();
}

class _RegisterCombState extends State<RegisterComb> {

  final litersController = TextEditingController();
  final valueController = TextEditingController();

  List<SaveComb> saveList = [];

  onSubmit(){
    final date = DateTime.now();
    final liters = double.tryParse(litersController.text) ?? 0.0;
    final value = double.tryParse(valueController.text) ?? 0.0;
    _addComb(date, liters, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            DateInputField(),
            NumberInputField(
              icon: Icon(Icons.local_gas_station_outlined),
              label: 'Liters',
              controller: litersController,
              onSubmitted: onSubmit(),
            ),
            NumberInputField(
              icon: Icon(Icons.attach_money_outlined),
              label: 'Value',
              controller: valueController,
              onSubmitted: onSubmit(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  _addComb(DateTime date, double liters, double value) {
    final saveComb = new SaveComb(
      id: Random().nextDouble().toString(),
      date: date,
      liters: liters,
      value: value,
    );
    setState(() {
      saveList.add(saveComb);
    });
  }
}
