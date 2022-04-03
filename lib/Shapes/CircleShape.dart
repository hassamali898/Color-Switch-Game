// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:color_switch/theme/Colors.dart';
import 'package:flutter/material.dart';

class CircleShape extends CustomPainter {
  final double x;
  final double y;
  final double radius;
  final Color color;
  final double angle;
  final double strockWidth;
  const CircleShape(
      {Key? key,
      required this.x,
      required this.angle,
      this.strockWidth = 16,
      this.color = primary_color,
      required this.y,
      this.radius = 100});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strockWidth;
    double startAngle = pi * angle;

    canvas.drawArc(
        Rect.fromLTRB(0, 0, radius, radius), startAngle, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
