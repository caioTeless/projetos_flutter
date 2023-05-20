import 'package:control_app/helpers/provider_save_db.dart';
import 'package:control_app/models/save_model.dart';
import 'package:intl/intl.dart';

class ProviderSaveController {
  final ProviderSaveDb _providerSaveDb;

  ProviderSaveController(this._providerSaveDb);

  List<SaveModel> data = <SaveModel>[];

  int? id;
  String date = '';
  String liters = '';
  String value = '';

  setDate(String? date) => date = date;
  setLiters(String? liters) => liters = liters;
  setTotal(String? value) => value = value;

  Future save() async {
    final data = SaveModel(
      id: id,
      date: date,
      liters: liters,
      value: value,
    );
    if (id == null) {
      await _providerSaveDb.create(data);
    } else {
      await _providerSaveDb.update(data);
    }
  }

  Future<void> readAll() async {
    data = await _providerSaveDb.readAll();
  }

  myPrint(int index){
    print('${data[index].id} - ${data[index].date}');
  }
}
