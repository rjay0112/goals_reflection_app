import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'db_utils.dart';
import 'Task.dart';

class TaskModel{
  Future<int> insertTask(Task task) async {
    final db = await DBUtils.init();
    return await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTask(Task task) async{
    final db = await DBUtils.init();
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.getID()],
    );
  }

  Future<int> deleteTaskById(int id) async{
    final db = await DBUtils.init();
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Task>> getAllTasks() async {
    final db = await DBUtils.init();
    List<Map<String,dynamic>> maps = await db.query('tasks');
    List<Task> tasks = [];
    print("hi");
    for(int i=0;i<maps.length;i++){
      print(Task.fromMap(maps[i]).toString());
      tasks.add(Task.fromMap(maps[i]));
    }
    return tasks;
  }
}