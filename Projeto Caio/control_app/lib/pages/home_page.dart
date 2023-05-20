import 'package:control_app/controllers/home_controller.dart';
import 'package:control_app/data/data_helper_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController(DataHelperDb());

  @override
  void initState() {
    _initItems();
    super.initState();
  }

  Future _initItems() async {
    await _homeController.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _homeController.length,
            itemBuilder: (ctx, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                actions: [
                  IconSlideAction(
                    icon: Icons.delete,
                  ),
                ],
                secondaryActions: [
                  IconSlideAction(
                    icon: Icons.call,
                  ),
                ],
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(_homeController.fuels[index].date!),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateToForm(context),
      ),
    );
  }

  _navigateToForm(BuildContext context) {
    Navigator.of(context).pushNamed('/register-data');
  }
}
