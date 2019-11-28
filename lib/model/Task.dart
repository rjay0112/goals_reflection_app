import 'package:flutter/material.dart';


class Task{
  int _id;
  bool _isCompleted;
  Color _backgroundColor;
  String _taskType;
  String _taskDescription;
  double _progress;
  double _goal;
  String _date;
  String _reward;

  Task(int id, String desc, String type, String date, double goal,String reward){
    this._id=id;
    this._taskDescription=desc;
    this._taskType=type;
    this._date=date;
    this._progress=0;
    this._goal=goal;
    this._reward=reward;
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

  Task.fromMap(Map<String,dynamic> map){
    this._id=map['id'];
    this._date=map['date'];
    this._taskDescription=map['description'];
    this._taskType=map['type'];
    this._progress=map['progress'];
    this._goal=map['goal'];
    this._reward=map['reward'];
  } 

  Map<String,dynamic> toMap(){
    return{
      'id':this._id,
      'date':this._date,
      'description':this._taskDescription,
      'type':this._taskType,
      'progress':this._progress,
      'goal':this._goal,
      'reward':this._reward,
    };
  }



  bool isTaskDone(){return _isCompleted;}
  int getID(){return this._id;}
  Color getBackColor(){return _backgroundColor;}
  String getTaskType(){return _taskType;}
  String getTaskDesc(){return _taskDescription;}
  String getReward(){return _reward;}
  double getGoal(){return _goal;}
  double getProgress(){return _progress;}
  void setProgress(double progress){this._progress=progress;}
  String getTaskDate(){return _date;}

  String toString(){
    return "$_taskDescription+$_taskType+$_date+$_progress+$_goal+$_reward";
  }
}

/*
class binaryTask extends Task{

}*/