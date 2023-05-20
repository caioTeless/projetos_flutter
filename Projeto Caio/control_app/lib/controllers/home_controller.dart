import 'package:control_app/data/data_helper_db.dart';
import 'package:control_app/model/fuel_control_model.dart';

class HomeController {

  final DataHelperDb _dataHelperDb;

  HomeController(this._dataHelperDb);

  List<FuelControl> fuels = [];

  bool loading = false;

  int get length => fuels.length > 0 ? fuels.length : 0;

  Future readAll() async{
    loading = true;
    fuels = await _dataHelperDb.readAll();
    loading = false;
  }
}
