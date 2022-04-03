// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:color_switch/Components/Ball.dart';
import 'package:color_switch/Components/MyCircle.dart';
import 'package:color_switch/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Components/Background.dart';

class HomeSrc extends StatefulWidget {
  const HomeSrc({Key? key}) : super(key: key);

  @override
  State<HomeSrc> createState() => _HomeSrcState();
}

class _HomeSrcState extends State<HomeSrc> {
  double ballY = 0.85;
  bool isGameStarted = false;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  double radius = 180;
  double rotate = 0;
  double enemyY = 0;
  double ballLastY = 0;
  int currentSwitch = 0;
  int nextSwitch = 0;
  double myvalue = 0.4;
  int score = 0;

  List<int> colors = [0xFFE91E63, 0xFF64B5F6, 0xFFFFEB3B, 0xFF9C27B0];
  late int ballColor;
  void jump() {
    setState(() {
      if (ballY > -0.9) {
        time = 0;
        initialHeight = ballY;
      }
    });
    if (ballY < 0 && enemyY > initialHeight) {
      if (enemyY - 1.9 >= 0) {
        enemyY = 0;
        myvalue = 1.4;
        currentSwitch = 1;
      }
      enemyY += initialHeight.abs() / 6;
    }
  }

  @override
  void initState() {
    ballColor = colors[Random().nextInt(colors.length)];
    super.initState();
  }

  void startGame() {
    isGameStarted = true;
    ballY = 0.69;
    initialHeight = ballY;
    Timer.periodic(Duration(microseconds: 50), (timer) {
      time += 0.003;
      height = -4.9 * time * time + 1.5 * time;
      changeColor();
      setState(() {
        if (ballY < 0.7) {
          ballY = initialHeight - height;
        }
        rotate = (rotate + 0.004) % 2.0;
      });
      //if player win
      if (ballY >= 0.7 || onTouchWall()) {
        timer.cancel();
        setState(() {
          isGameStarted = false;
          time = 0;
          height = 0;
          ballY = 0.85;
          initialHeight = 0;
          enemyY = 0;
          myvalue = 0.4;
          currentSwitch = 0;
          score = 0;
        });
      }
    });
  }

  void ballDirections() {
    setState(() {
      if (ballY < 0.7) {
        ballY += 0.001;
      }
    });
  }

  bool onTouchWall() {
    switch (ballColor) {
      case 0xFFE91E63:
        if ((enemyY - currentSwitch) - 0.155 >= ballY &&
            (enemyY - currentSwitch) - 0.205 <= ballY) {
          if (rotate >= 1 && rotate <= 1.49) return false;
          return true;
        } else if ((enemyY - currentSwitch) + 0.155 <= ballY &&
            (enemyY - currentSwitch) + 0.205 >= ballY) {
          if (rotate >= 0 && rotate <= 0.49) return false;
          return true;
        }
        return false;
      case 0xFF64B5F6:
        if ((enemyY - currentSwitch) - 0.155 >= ballY &&
            (enemyY - currentSwitch) - 0.205 <= ballY) {
          if (rotate >= 0.5 && rotate <= 0.99) return false;
          return true;
        } else if ((enemyY - currentSwitch) + 0.155 <= ballY &&
            (enemyY - currentSwitch) + 0.205 >= ballY) {
          if (rotate >= 1.5 && rotate <= 1.99) return false;
          return true;
        }
        return false;
      case 0xFFFFEB3B:
        if ((enemyY - currentSwitch) - 0.155 >= ballY &&
            (enemyY - currentSwitch) - 0.205 <= ballY) {
          if (rotate >= 0 && rotate <= 0.49) return false;
          return true;
        } else if ((enemyY - currentSwitch) + 0.155 <= ballY &&
            (enemyY - currentSwitch) + 0.205 >= ballY) {
          if (rotate >= 1 && rotate <= 1.49) return false;
          return true;
        }
        return false;
      case 0xFF9C27B0:
        if ((enemyY - currentSwitch) - 0.155 >= ballY &&
            (enemyY - currentSwitch) - 0.205 <= ballY) {
          if (rotate >= 1.5 && rotate <= 1.99) return false;
          return true;
        } else if ((enemyY - currentSwitch) + 0.155 <= ballY &&
            (enemyY - currentSwitch) + 0.205 >= ballY) {
          if (rotate >= 0.5 && rotate <= 0.99) return false;
          return true;
        }
        return false;
      default:
        return false;
    }
  }

  void changeColor() {
    if (enemyY - myvalue >= ballY) {
      int tempColor;
      while (true) {
        tempColor = colors[Random().nextInt(colors.length)];
        if (ballColor != tempColor) {
          setState(() {
            ballColor = tempColor;
            currentSwitch++;
            myvalue++;
            score++;
          });
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if (event.isKeyPressed(LogicalKeyboardKey.space)) {
            isGameStarted ? jump() : startGame();
          }
        },
        child: GestureDetector(
          onTap: isGameStarted ? jump : startGame,
          child: Container(
            width: size.width,
            height: size.height,
            color: background_color,
            child: Stack(
              children: [
                if (!isGameStarted)
                  Container(
                    alignment: Alignment(0, 0),
                    child: AvatarGlow(
                      endRadius: 80.0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: background_color_light,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.play_arrow_rounded,
                          color: primary_color,
                          size: 60,
                        )),
                      ),
                    ),
                  ),
                Container(
                  alignment: Alignment(-0.9, -0.95),
                  child: Text(
                    '$score',
                    style: TextStyle(color: primary_color, fontSize: 50),
                  ),
                ),
                // Background
                Background(
                  colors: colors,
                  angle: rotate,
                  y: enemyY,
                ),
                //Ball
                Ball(
                  x: 0,
                  y: ballY,
                  color: Color(ballColor),
                ),
                //Enemy
                MyCircle(
                  radius: radius,
                  angle: rotate,
                  x: 0,
                  y: enemyY,
                  colors: colors,
                ),
                if (currentSwitch == 0 || currentSwitch > 3)
                  MyCircle(
                    radius: 16,
                    angle: 0,
                    x: 0,
                    y: enemyY - 0.4,
                    strockWidth: 16,
                    colors: colors,
                  ),
                MyCircle(
                  radius: radius,
                  angle: rotate,
                  x: 0,
                  y: enemyY - 1,
                  colors: colors,
                ),
                if (currentSwitch <= 1)
                  MyCircle(
                    radius: 16,
                    angle: 0,
                    x: 0,
                    y: enemyY - 1.4,
                    strockWidth: 16,
                    colors: colors,
                  ),
                MyCircle(
                  radius: radius,
                  angle: rotate,
                  x: 0,
                  y: enemyY - 2,
                  colors: colors,
                ),
                if (currentSwitch <= 2)
                  MyCircle(
                    radius: 16,
                    angle: 0,
                    x: 0,
                    y: enemyY - 2.4,
                    strockWidth: 16,
                    colors: colors,
                  ),
                MyCircle(
                  radius: radius,
                  angle: rotate,
                  x: 0,
                  y: enemyY - 3,
                  colors: colors,
                ),
                if (currentSwitch != 0)
                  MyCircle(
                    radius: 16,
                    angle: 0,
                    x: 0,
                    y: enemyY - 3.4,
                    strockWidth: 16,
                    colors: colors,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
