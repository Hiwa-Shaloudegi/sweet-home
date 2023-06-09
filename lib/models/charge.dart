class ChargeTable {
  static const String name = 'charge';

  static const String id = '_id';
  static const String title = 'title';
  static const String date = 'date';
  static const String amount = 'amount';
  static const String unitId = 'unitId';

  static final List<String> allColumns = [
    id,
    title,
    date,
    amount,
    unitId,
  ];
}

class Charge {
  int? id;
  String? title;
  String? date;
  int? amount;
  int? unitId;
  // Unit? unit;

  Charge({
    this.id,
    this.title,
    this.date,
    this.amount,
    this.unitId,
    // this.unit,
  });

  Charge.fromMap(Map<String, dynamic> map) {
    id = map[ChargeTable.id];
    title = map[ChargeTable.title];
    date = map[ChargeTable.date];
    amount = map[ChargeTable.amount];
    unitId = map[ChargeTable.unitId];
  }

  Map<String, dynamic> toMap() {
    return {
      ChargeTable.id: id,
      ChargeTable.title: title,
      ChargeTable.date: date,
      ChargeTable.amount: amount,
      ChargeTable.unitId: unitId,
    };
  }
}
