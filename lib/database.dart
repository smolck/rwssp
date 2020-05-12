import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDB extends ChangeNotifier {
  final Database _db;

  AppDB(this._db);

  static Future<AppDB> initDb({@required int version}) async => AppDB(
        await openDatabase(
          join(
            await getDatabasesPath(),
            'database.db',
          ),
          onCreate: (db, version) => db.execute(
            'CREATE TABLE favorites(reference TEXT, CONSTRAINT ref_unique UNIQUE (reference))',

            // 'CREATE TABLE favorites(id INTEGER PRIMARY KEY, reference TEXT, CONSTRAINT id_ref_unique UNIQUE (id, reference))',
          ),
          version: version,
        ),
      );

  Future<void> insert(String table, Map<dynamic, dynamic> data) async {
    try {
      await _db.insert(table, data);

      notifyListeners();
    } on DatabaseException {
      // TODO (?)
      print('Already in database.');
    }
  }

  Future<void> delete(String table,
      {@required String where, @required List<dynamic> whereArgs}) async {
    await _db.delete(table, where: where, whereArgs: whereArgs);

    notifyListeners();
  }

  /* Future<int> newIdFor(String table) async {
    var ids = (await _db.query(table)).map((x) => x['id']).toList();
    ids.sort();

    int id;
    if (ids.length != 0) {
      id = ids.last + 1;
    } else {
      id = 0;
    }

    return id;
  } */

  Future<void> update(String table, dynamic newData,
      {@required String where, @required List<dynamic> whereArgs}) async {
    await _db.update(table, newData, where: where, whereArgs: whereArgs);

    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {@required String where, @required List<dynamic> whereArgs}) async {
    final retVal = await _db.query(table, where: where, whereArgs: whereArgs);

    notifyListeners();
    return retVal;
  }
}
