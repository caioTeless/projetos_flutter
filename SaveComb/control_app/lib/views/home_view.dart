import 'package:control_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTROL'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Card(
                      elevation: 4,
                      child: Text('Heelo'),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.REGISTER_FUEL);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
