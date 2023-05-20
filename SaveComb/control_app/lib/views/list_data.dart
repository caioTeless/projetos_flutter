import 'package:control_app/models/save_model.dart';
import 'package:flutter/material.dart';

class ListData extends StatefulWidget {

  final List<SaveModel> saveDataList = [];

  ListData({required this.saveDataList});

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Text(widget.saveDataList[index].date!),
      ),
    );
  }
}
