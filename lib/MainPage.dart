import 'dart:ui';
import 'package:flutter/material.dart';
import 'DateKeep.dart';
import 'model/Task.dart';
import 'model/TaskModel.dart';
import 'package:expandable/expandable.dart';
import 'WritingPad.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GoalDate curDate=GoalDate(new DateTime.now());
  List<GoalDate> twoWeeks=[];
  final _model = TaskModel(); 

  @override
  Widget build(BuildContext context) {
    //print("My Whole screen is being build.");
    return Scaffold(
      appBar: AppBar(
        title: Text(curDate.titleDate(), textAlign: TextAlign.center,),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Home"),
            Text("Calendar View"),
            Text("Rewards"),
            Text("Settings"),
        ],),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _goals(),
            _twoWeekCalendar(),
            WritingPad(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: (){
          _model.getAllTasks();
          _model.insertTask(curDate.getTasks()[0]);
          _model.getAllTasks();
        },
      ), 
    );
  }

  Widget _twoWeekCalendar(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      child: GridView.count(
      crossAxisCount: 7,
      children: <Widget>[
        Text("M"),
        Text("T"),
        Text("W"),
        Text("Th"),
        Text("F"),
        Text("Sa"),
        Text("Su"),
        Text("M"),
      ],
      )
    );
  }

  

  Widget _goals(){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListView.separated(
        //padding: EdgeInsets.all(5.0),
          itemCount: curDate.getTasks().length,
          itemBuilder: (BuildContext context, int index){
            List<Task> tasks =curDate.getTasks();
            return buildLargeGoalLayout(context,tasks[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
      )
    );
  }

  Widget buildLargeGoalLayout(BuildContext context, Task task){
    return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: task.getBackColor(),
    ),
    padding: EdgeInsets.all(5.0),
    height: MediaQuery.of(context).size.height*0.1,
    child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("${task.getTaskDesc()}"),
                  Text("${task.getTaskType()}"),
                  Text("${task.getTaskDate()}"),
                  Text("${task.getProgress()}/${task.getGoal()}"),
                ],
              ),
  );
  }


}


