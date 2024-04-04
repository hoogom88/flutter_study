import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class BusinessCard extends StatefulWidget {
  const BusinessCard({super.key});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  double radians = 180 * pi / 180;
  double leftPoint = 0;
  double topPoint = 25;
  static const double lottieSize = 50;
  late double bottomEnd;
  late double rightEnd;
  double moveDistance = 10;
  bool isMove = false;
  @override
  void dispose() {
    super.dispose();
    isMove = false;
  }

  void startMove() async{
    while(isMove) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        if (topPoint == 25 && leftPoint < rightEnd) {
          radians = 180 * pi / 180;
          leftPoint += moveDistance;
        } else if (leftPoint >= rightEnd && topPoint < bottomEnd - 25) {
          radians = 270 * pi / 180;
          topPoint += moveDistance;
        } else if (leftPoint > 0) {
          radians = 0 * pi / 180;
          leftPoint -= moveDistance;
        } else {
          radians = 90 * pi / 180;
          topPoint -= moveDistance;
        }
      });
    }
  }
  void onOff() {
    print('터치$isMove');
    isMove = isMove ? false : true;
    if (isMove) startMove();
  }
  @override
  Widget build(BuildContext context) {
    rightEnd = MediaQuery.of(context).size.width - lottieSize;
    bottomEnd = MediaQuery.of(context).size.height - lottieSize;
    print('$rightEnd, $bottomEnd');
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            child: Transform.rotate(
              angle: radians,
              child: Lottie.network(
                'https://lottie.host/dabd4a46-f163-48c5-ac43-765bb69028d8/joUPBX5Ckh.json',
                width: lottieSize,
                height: lottieSize,
              ),
            ),
            left: leftPoint,
            top: topPoint,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: GestureDetector(
                    onTap: onOff,
                    child: Lottie.network(
                        'https://lottie.host/0b1f24e0-3b6a-4c9f-8746-9e24b51345c4/ZICBLxYxpy.json',
                        width: double.infinity,
                    ),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 2),
                        children: [
                      TextSpan(text: '밥 먹는 개발자'),
                      TextSpan(
                          text: ' 전종현',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_missed,
                      size: 25,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'don\'t call me',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
