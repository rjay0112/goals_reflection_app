import 'Task.dart';
import 'package:flutter/material.dart';


class GoalDate{
  List<String> weekdays=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
  List<String> month=["January","February","March","April","May","June","July","August","September","October","November","December"];
  List<Task> _todayTasks=[];
  DateTime _currentDate;
  GoalDate(DateTime curDate){
  _todayTasks.add(new Task("binary","Complete Mobile Lab"));
  _todayTasks.add(new Task("time","Spend 30 minutes reading"));
  _todayTasks.add(new Task("progress","Review 20 Astronomy Slides"));
  _todayTasks.add(new Task("binary","Complete Mobile Lab"));
  _todayTasks.add(new Task("time","Spend 30 minutes reading"));
  _todayTasks.add(new Task("progress","Review 20 Astronomy Slides"));
  _todayTasks.add(new Task("none","Do nothing"));
  _todayTasks.add(new Task("progress","Review 2 lectures"));


  _currentDate=curDate;
  }
  void addTask(Task task){_todayTasks.add(task);}
  List<Task> getTasks(){
    return this._todayTasks;
  }
  String titleDate(){
    return "${weekdays[_currentDate.weekday]} ${month[_currentDate.month]} ${_currentDate.day}, ${_currentDate.year}";
  }
}