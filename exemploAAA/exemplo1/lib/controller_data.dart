import 'package:exemplo1/db_helper.dart';
import 'package:exemplo1/exemplo_model.dart';

class ControllerData{

  final DbHelper dbHelper;

  ControllerData(this.dbHelper);

  List<ExemploModel> datas = <ExemploModel>[];

  int get length => datas.length > 0 ? datas.length : 0;

  bool loading = false;

  Future readAll() async{
    loading = true;
    datas = await dbHelper.readAll();
    loading = false;
  }
}