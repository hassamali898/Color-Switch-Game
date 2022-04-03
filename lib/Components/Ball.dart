import 'package:color_switch/theme/Colors.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double x;
  final double y;
  final Color color;
  const Ball({Key? key, required this.x, required this.y, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(x, y),
      duration: Duration(microseconds: 0),
      child: Container(
        // ignore: prefer_const_constructors
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: color,
        //     width: 5,
        //   ),
        //   shape: BoxShape.circle,
        // ),
        width: 180,
        height: 180,
        child: Center(
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
