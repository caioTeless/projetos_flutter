class FuelControl {
  int? id;
  String? date;
  double? liters;
  double? total;

  FuelControl({
    this.id,
    required this.date,
    required this.liters,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'date': date,
      'liters': liters,
      'total': total,
    };
    if (id != null) data['id'] = id;
    return data;
  }

  factory FuelControl.fromMap(Map<String, dynamic> map) {
    return FuelControl(
      id: map['id'],
      date: map['date'],
      liters: map['liters'],
      total: map['total'],
    );
  }
}
