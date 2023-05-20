import 'dart:convert';

class SaveModel {
  int? id;
  String? date;
  String? liters;
  String? value;

  SaveModel({
    this.id,
    required this.date,
    required this.liters,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'date': date,
      'liters': liters,
      'value': value,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  factory SaveModel.fromMap(Map<String, dynamic> map) {
    return SaveModel(
      id: map['id'],
      date: map['date'],
      liters: map['liters'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SaveModel.fromJson(String source) =>
      SaveModel.fromMap(json.decode(source));
}
