class ProviderModel {
  int? id;
  String name;

  ProviderModel({this.id, required this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'name': name,
    };
    if (id != null) data['id'] = id;
    return data;
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
