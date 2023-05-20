import 'package:control_app/model/fuel_control_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemsCard extends StatelessWidget {
  
  final FuelControl fuelControl;

  ItemsCard(this.fuelControl);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: _buildCard(),
    );
  }

  _buildCard() {
    return InkWell(
      onTap: ()  {},
      child: Container(
        child: ListTile(
          title: Text(fuelControl.date!),
          subtitle: Text('R\$${fuelControl.total!.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}

