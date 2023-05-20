import 'package:control_app/data/data_helper_db.dart';
import 'package:control_app/model/fuel_control_model.dart';

class FormController{

  DataHelperDb _dbHelper;

  FormController(this._dbHelper);

  int? id;
  String? date;
  double? liters;
  double? total;

  Future save() async{
    final data = FuelControl(
      id: id,
      date: date,
      liters: liters,
      total: total,
    );
    if(id == null){
      await _dbHelper.insert(data);
    }else{
      await _dbHelper.update(data);
    }
  }

}