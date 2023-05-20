
import 'package:flutter/material.dart';

class ReportHomePage extends StatefulWidget{

  @override
  _ReportHomePageState createState() => _ReportHomePageState();
  
}

class _ReportHomePageState extends State<ReportHomePage>{

  @override
  Widget build(BuildContext contenxt){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report app'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: _buildForm(),
        ),
      ),
    );
  }

  _buildForm(){
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderText('BuildReport'),
          _buildVerticalSpace(),
          _buildInputField(
            'Valor',
          ),
        ],
      ),
    );
  }

  _buildHeaderText(String label){
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.2),
      height: 40,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildVerticalSpace({double height = 20.0}){
    return SizedBox(height: height);
  }

  _buildInputField(String label){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      )
    );
  }
}
