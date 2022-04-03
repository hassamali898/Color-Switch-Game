import 'package:color_switch/Components/MyCircle.dart';
import 'package:color_switch/theme/Colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final double angle;
  final List<int> colors;
  final double y;
  const Background(
      {Key? key, required this.angle, required this.colors, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, y + 1.12),
      child: Container(
          width: 200,
          height: 300,
          child: Column(
            children: [
              Container(
                  child: Stack(
                children: [
                  Container(
                    alignment: Alignment(0, 0),
                    child: Text("C   l   r\nSwitch".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: background_color_light,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyCircle(
                          angle: angle,
                          radius: 30,
                          x: 0,
                          y: 0,
                          strockWidth: 5,
                          colors: colors,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15)),
                        MyCircle(
                          angle: angle,
                          radius: 30,
                          x: 0,
                          y: 0,
                          strockWidth: 5,
                          colors: colors,
                        )
                      ],
                    ),
                  )
                ],
              )),
              Container(
                child: const Icon(Icons.touch_app,
                    color: background_color_light, size: 100),
              )
            ],
          )),
    );
  }
}
