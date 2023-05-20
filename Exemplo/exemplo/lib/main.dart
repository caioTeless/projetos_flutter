import 'package:exemplo/provider_controller.dart';
import 'package:exemplo/provider_helper.dart';
import 'package:flutter/material.dart';

main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {

  final _controller = ProviderController(ProviderHelper());
  final _formKey = GlobalKey<FormState>();

  _onSave() async{
    _formKey.currentState!.save();
    await _controller.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Something'),
                onSaved: _controller.setText,
              ),
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
}
