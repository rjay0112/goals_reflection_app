import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:expandable/expandable.dart';


class WritingPad extends StatefulWidget{
  WritingPad();

  @override
  _WritingPadState createState() => _WritingPadState();
}

class _WritingPadState extends State<WritingPad>{
  List<DrawingPoints> points = List();
    //Writing variables
  Color selectedColor = Colors.black;
  double strokeWidth = 1.5; 
  double opacity = 1.0;

  @override
  Widget build(BuildContext context){
    //print("rebuilding");
    return Container(
      padding: EdgeInsets.only(top:10.0),
      decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      //color:,
      ),
      child:ExpandablePanel(
        header: _collapsedWriting(),
        //collapsed: Text("area to actually write"),
        expanded: _drawingArea(),
        tapHeaderToExpand: true,
      )
    );
  }

  Widget _drawingArea(){
    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.4,
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

  Widget _collapsedWriting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Written Review"),
        Icon(Icons.create),
      ],
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
