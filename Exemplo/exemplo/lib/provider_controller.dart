import 'package:exemplo/provider_helper.dart';
import 'package:exemplo/provider_model.dart';

class ProviderController {
  ProviderHelper _providerHelper;

  ProviderController(this._providerHelper);

  int? id;
  String name= '';

  setId(int? id) => id = id;
  setText(String? text) => name = text!;

  Future save() async {
    print('metodo sabe controller');
    final data = ProviderModel(
      id: id,
      name: name,
    );
    if (id == null) {
      _providerHelper.insert(data);
    }
    print('saiu do save controller');
  }
}
