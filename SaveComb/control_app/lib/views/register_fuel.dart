import 'package:control_app/controllers/provider_save_controller.dart';
import 'package:control_app/helpers/provider_save_db.dart';
import 'package:control_app/models/save_model.dart';
import 'package:control_app/widgets/date_input_field.dart';
import 'package:control_app/widgets/number_input_field.dart';
import 'package:flutter/material.dart';

class RegisterFuel extends StatefulWidget {
  const RegisterFuel({Key? key}) : super(key: key);

  @override
  _RegisterFuelState createState() => _RegisterFuelState();
}

class _RegisterFuelState extends State<RegisterFuel> {
  final _formKey = GlobalKey<FormState>();
  final _providerSaveController = ProviderSaveController(ProviderSaveDb());

  @override
  void initState() {
    _providerSaveController.readAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DateInputField(
                      text: 'Type a date',
                      prefixIcon: Icon(Icons.date_range),
                      sufixIcon: Icon(Icons.keyboard_arrow_down),
                      onSaved: _providerSaveController.setDate,
                    ),
                    SizedBox(height: 10),
                    NumberInputField(
                      text: 'Type the amount of liters',
                      icon: Icon(Icons.local_gas_station),
                      onSaved: _providerSaveController.setLiters,
                    ),
                    SizedBox(height: 10),
                    NumberInputField(
                      text: 'Type the total',
                      icon: Icon(Icons.attach_money),
                      onSaved: _providerSaveController.setTotal,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: _onSave,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Press to print'),
                      onPressed: () {
                        setState(() {
                          _providerSaveController.myPrint(0);
                        });
                      },
                    )

                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _onSave() async {
    _formKey.currentState!.save();
    await _providerSaveController.save();
  }
}
