import 'package:flutter/material.dart';
import 'package:save_comb/components/app_bar.dart';
import 'package:save_comb/helpers/app_routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: InkWell(
        onTap: () => _navigateRegisterPage(context),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Text'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.REGISTER_PAGE);
  }
}
