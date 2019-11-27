import 'model/Task.dart';
import 'package:flutter/material.dart';
import 'DateUtils.dart';


class GoalDate{
  List<Task> _todayTasks=[];
  DateTime _currentDate;
  GoalDate(DateTime curDate){
  _todayTasks.add(new Task("To run 5km","progression",dateToShortString(curDate),5.0));
  _todayTasks.add(new Task("To make popcorn","binary",dateToShortString(curDate),1.0));
  _todayTasks.add(new Task("To read 20 min","timed",dateToShortString(curDate),20.0));
  _currentDate=curDate;
  }
  void addTask(Task task){_todayTasks.add(task);}
  List<Task> getTasks(){
    return this._todayTasks;
  }
  String titleDate(){
    return "${intToWeekday(_currentDate.weekday)} ${intToMonth(_currentDate.month)} ${_currentDate.day}, ${_currentDate.year}";
  }
}