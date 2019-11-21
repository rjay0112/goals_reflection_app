import 'package:flutter/material.dart';


class Task{
  bool _isCompleted;
  Color _backgroundColor;
  String _taskType;
  String _description;

  Task(String _taskType, String _description){
    this._taskType=_taskType;
    this._description=_description;
    if(_taskType=="binary"){
      _backgroundColor=Colors.red[300];
    }else if(_taskType=="progress"){
      _backgroundColor=Colors.blue[300];
    }else if(_taskType=="time"){
      _backgroundColor=Colors.green[300];
    }else{
      _backgroundColor=Colors.purple;
    }
  }

  bool isTaskDone(){return _isCompleted;}
  Color getBackColor(){return _backgroundColor;}
  String getTaskType(){return _taskType;}


  Widget buildMainpagelayout(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: _backgroundColor,
    ),
    padding: EdgeInsets.all(5.0),
    height: MediaQuery.of(context).size.height*0.1,
    child:Text("$_description"),
  );
  }


}

/*
class binaryTask extends Task{

}*/