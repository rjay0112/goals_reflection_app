import 'package:flutter/material.dart';


class Task{
  bool _isCompleted;
  Color _backgroundColor;
  String _taskType;
  String _taskDescription;
  double _progress;
  double _goal;
  String _date;

  Task(String desc, String type, String date, double goal){
    this._taskDescription=desc;
    this._taskType=type;
    this._date=date;
    this._progress=0;
    this._goal=goal;
    setTaskColour(type);
  }

  void setTaskColour(String type){
    if(type=="binary"){
      _backgroundColor=Colors.teal;
    }else if(type=="progression"){
      _backgroundColor=Colors.amber;
    }else if(type=="timed"){
      _backgroundColor=Colors.indigo;
    }else{
      _backgroundColor=Colors.grey[200];
    }
  }

  bool isTaskDone(){return _isCompleted;}
  Color getBackColor(){return _backgroundColor;}
  String getTaskType(){return _taskType;}
  String getTaskDesc(){return _taskDescription;}
  double getGoal(){return _goal;}
  double getProgress(){return _progress;}
  void setProgress(double progress){this._progress=progress;}
  String getTaskDate(){return _date;}
}

/*
class binaryTask extends Task{

}*/