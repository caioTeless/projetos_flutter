class ExemploModel {
  int? id;
  String date;
  String name;
  double number;

  ExemploModel({
    this.id,
    required this.date,
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'date': date,
      'name': name,
      'number': number,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  factory ExemploModel.fromMap(Map<String, dynamic> map) {
    return ExemploModel(
      id: map['id'],
      date: map['date'],
      name: map['name'],
      number: map['number'],
    );
  }
}
