import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  double _playedPoint = 0.0;
  late double rightEnd;
  bool _isMove = false;

  @override
  void dispose() {
    super.dispose();
    _isMove = false;
  }

  void startMove() async {
    while (_isMove) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        if (_playedPoint < rightEnd) {
          _playedPoint += rightEnd / 150;
        }
      });
    }
  }

  void onOff() {
    _isMove = _isMove ? false : true;
    if (_isMove) startMove();
  }

  @override
  Widget build(BuildContext context) {
    rightEnd = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: GestureDetector(
                    onTap: onOff,
                    child: Image.network(
                      'https://health.chosun.com/site/data/img_dir/2024/01/22/2024012201607_0.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Divider(
                      height: 8,
                      thickness: 3,
                      color: Colors.red,
                    ),
                    Divider(
                      height: 8,
                      indent: _playedPoint,
                      thickness: 3,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 22,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc1HZkcmu9-BMMh_dPu2EhUjvzHqECJk7ekBvldoUtfQ&s'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '제목',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '내용 관련 정보',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Icon(Icons.more_vert, color: Colors.white, size: 20,),
                      )

                    ],
                  ),
                )
                // child: Image.asset('assets/compass.png', fit: BoxFit.cover, height: 400))
              ],
            ),
            Visibility(
              visible: _playedPoint != 0.0,
              child: Positioned(
                  top: 250 - 7,
                  left: _playedPoint - 6,
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
