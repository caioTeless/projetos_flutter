import 'package:exemplo1/controller_data.dart';
import 'package:exemplo1/db_helper.dart';
import 'package:exemplo1/exemplo_model.dart';
import 'package:exemplo1/form_exemplo.dart';
import 'package:flutter/material.dart';

main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DbHelper();
  final controller = ControllerData(DbHelper());
  bool loading = true;

  @override
  void initState() {
    getAll();
    super.initState();
  }

  Future getAll() async {
    // models = await dbHelper.readAll();
    await controller.readAll();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Container(
        child: loading ? CircularProgressIndicator() : ListView.builder(
          itemCount: controller.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Text(controller.datas[index].name),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FormExemplo()),
            );
          }),
    );
  }
}
