import 'package:sweet_home/models/apartment.dart';

import 'db_helper.dart';

class ApartmentRepository {
  ApartmentRepository._();

  static final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  static Future<Apartment> create(Apartment apartment) async {
    var db = await _databaseHelper.database;

    apartment.id = await db.insert(ApartmentTable.name, apartment.toMap());
    return apartment;
  }

  static Future<Apartment?> read(int id) async {
    var db = await _databaseHelper.database;

    final maps = await db.query(
      ApartmentTable.name,
      columns: ApartmentTable.allColumns,
      where: '${ApartmentTable.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Apartment.fromMap(maps.first);
    } else {
      // throw Exception('ID $id not found');
      return null;
    }
  }

  static Future<int> update(Apartment apartment) async {
    var db = await _databaseHelper.database;

    return db.update(
      ApartmentTable.name,
      apartment.toMap(),
      where: '${ApartmentTable.id} = ?',
      whereArgs: [apartment.id],
    );
  }

  static Future<int> delete(int id) async {
    var db = await _databaseHelper.database;

    return await db.delete(
      ApartmentTable.name,
      where: '${ApartmentTable.id} = ?',
      whereArgs: [id],
    );
  }
}
