import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future<Database> init() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'task_history.db'),
      onCreate: (db, version) {
        if (version > 1) {
          // downgrade path
        }
        db.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, date TEXT, description TEXT, type TEXT, progress REAL, goal REAL)');
      },
      version: 1,
    );
  }
}