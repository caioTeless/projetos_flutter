import 'package:control_app/controllers/provider_save_controller.dart';
import 'package:control_app/helpers/provider_save_db.dart';
import 'package:flutter/material.dart';

class ListViewData extends StatelessWidget {

  final controller = ProviderSaveController(ProviderSaveDb());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(itemCount: controller.data.length, itemBuilder: (context, index){
        return Text('${controller.data[index]}');
      }),
    );
  }
}