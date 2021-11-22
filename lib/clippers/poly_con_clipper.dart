import 'dart:math';

import 'package:flutter/material.dart';

class PolyContainerDynamicClipper extends CustomClipper<Path>{
  int sides;
  double startAngle;

  PolyContainerDynamicClipper({required this.sides, this.startAngle = 0 }){
    startAngle = 90 - startAngle;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    final double angleDif = 360/sides;
    List<double> angleList = [];

    // Obtain polygon angles
    double angle = 0;
    while(angle < 360){
      angleList.add(angle+startAngle);
      angle += angleDif;
    }

    // Initialise circle defaults
    double radius = min(size.width,size.height)/2;
    double x0 = size.width / 2;
    double y0 = size.height / 2;
    double y = 0;
    double x = radius ;

    List<List<double>> xyPoints = [];
    for(double angle in angleList){
      x = radius* cos(getInRads(angle));
      x = x0+x;

      List<double> tempArray = [x];
      y = getYOnCircle(radius, x0, y0, x, angle);
      y= y0-y;
      tempArray.add(y);
      xyPoints.add(tempArray);
    }
    xyPoints.add(xyPoints[0]);

    path.moveTo(xyPoints[0][0], xyPoints[0][1]);
    for(List<double> point in xyPoints){
      path.lineTo(point[0], point[1]);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  double getInRads(double angle) => (angle * pi) / 180;

  double getYOnCircle(double radius, double x0, double y0, double x, double angle) {
    final sinAngle = sin(getInRads(angle));
    final double answerSq = (radius*radius)-pow((x -x0),2) ;
    final answer = sqrt(answerSq);
    return sinAngle<0 ? -1*  answer: answer;
  }

}