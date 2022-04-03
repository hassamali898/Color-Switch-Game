import 'package:flutter/material.dart';

import '../Shapes/CircleShape.dart';

class MyCircle extends StatelessWidget {
  final double radius;
  final double angle;
  final double x;
  final double y;
  final double strockWidth;
  final List<int> colors;
  const MyCircle(
      {Key? key,
      required this.radius,
      required this.angle,
      required this.x,
      required this.y,
      this.strockWidth = 16,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Stack(
        children: [
          CustomPaint(
              size: Size(radius, radius),
              painter: CircleShape(
                  strockWidth: strockWidth,
                  x: 0,
                  y: 0,
                  radius: radius,
                  angle: angle,
                  color: Color(colors[0]))),
          CustomPaint(
              size: Size(radius, radius),
              painter: CircleShape(
                  strockWidth: strockWidth,
                  x: 0,
                  y: 0,
                  radius: radius,
                  angle: angle + 0.5,
                  color: Color(colors[1]))),
          CustomPaint(
              size: Size(radius, radius),
              painter: CircleShape(
                  strockWidth: strockWidth,
                  x: 0,
                  y: 0,
                  radius: radius,
                  angle: angle + 1,
                  color: Color(colors[2]))),
          CustomPaint(
              size: Size(radius, radius),
              painter: CircleShape(
                  strockWidth: strockWidth,
                  x: 0,
                  y: 0,
                  radius: radius,
                  angle: angle + 1.5,
                  color: Color(colors[3]))),
        ],
      ),
    );
  }
}
