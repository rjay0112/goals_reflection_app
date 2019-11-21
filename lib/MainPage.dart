import 'dart:ui';
import 'package:flutter/material.dart';
import 'DateKeep.dart';
import 'Task.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Writing variables
  Color selectedColor = Colors.black;
  double strokeWidth = 1.5;
  double opacity = 1.0;
  GoalDate curDate=GoalDate(new DateTime.now());
  List<GoalDate> twoWeeks=[];

  List<DrawingPoints> points = List();

  @override
  Widget build(BuildContext context) {
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
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _goals(),
            _drawingArea(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }

  Widget _goals(){
    return Expanded(
      child: ListView.builder(
          itemCount: curDate.getTasks().length,
          itemBuilder: (BuildContext context, int index){
            List<Task> tasks =curDate.getTasks();
            return Container(
              height: MediaQuery.of(context).size.height*0.1,
              color: tasks[index].getBackColor(),
              child:Text("${tasks[index].getTaskType()}"),
            );
          },
        )
    );
  }

  Widget _drawingArea(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.5,
      child:GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject();
            points.add(DrawingPoints(
                points: details.localPosition,//renderBox.globalToLocal(details.globalPosition),
                paint: Paint()
                  ..isAntiAlias = true
                  ..color = selectedColor
                  ..strokeWidth = strokeWidth));
          });
        },
        onPanStart: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject();
            points.add(DrawingPoints(
                points: details.localPosition,//renderBox.globalToLocal(details.globalPosition),
                paint: Paint()
                  ..isAntiAlias = true
                  ..color = selectedColor
                  ..strokeWidth = strokeWidth));
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(null);
          });
        },
        child: ClipRect(
          child:CustomPaint(
            child: Container(
              //color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
            ),
            painter: DrawingPainter(
              pointsList: points,
            ),
          ),
        ),
      ),
    );
  }
}


class DrawingPainter extends CustomPainter {
  DrawingPainter({this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = List();
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      print(pointsList.length);
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}

class DrawingPoints {
  Paint paint;
  Offset points;
  DrawingPoints({this.points, this.paint});
}

enum SelectedMode { StrokeWidth, Opacity, Color }
