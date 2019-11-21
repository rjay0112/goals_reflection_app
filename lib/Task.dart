import 'package:flutter/material.dart';


class Task{
  bool _isCompleted;
  Color _backgroundColor;
  String _taskType;

  Task(this._backgroundColor,this._taskType);

  bool isTaskDone(){return _isCompleted;}
  Color getBackColor(){return _backgroundColor;}
  String getTaskType(){return _taskType;}


}