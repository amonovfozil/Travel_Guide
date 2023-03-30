import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class PlaceDB {
  static Future<sql.Database> DataBase() async {
    final Dbpath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(Dbpath, "Places.db"),
      onCreate: (db, version) {
        return db.execute(
            'CREAT TABLE new_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String Table, Map<String, dynamic> data) async {
    final SQLdb = await PlaceDB.DataBase();
    SQLdb.insert(
      Table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String Table) async {
    final SQLdb = await PlaceDB.DataBase();
    return SQLdb.query(Table);
  }
}
