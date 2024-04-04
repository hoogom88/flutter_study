import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
              child: Image.network(
                  'https://i.namu.wiki/i/x3-Dg7Tgf5UHErjd6dPt-ZqFY2zaYv2Lhl7enEfipCRWnUwQkHIoY_mH2U8_IoOwPSE2jFv6tU1lClJIul_vIQ.webp')),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 150.0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('안녕? 나는 햄버거\n너의 생일을 축하해',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
