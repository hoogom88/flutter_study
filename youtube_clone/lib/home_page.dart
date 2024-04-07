import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/video_card.dart';

class HomePage extends StatelessWidget {
  final _iconSize = 25.0;
  final smallTags = const ['전체', '게임', '뉴스', '실시간', '믹스', '어쩌구', '저쩌구'];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Image.network(
                  'https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-06-512.png',
                  height: _iconSize,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Youtube',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),

            actions: [
              IconButton(
                iconSize: _iconSize,
                onPressed: () {
                  print('클릭0');
                },
                icon: Icon(Icons.cast, color: Colors.white,),
              ),
              IconButton(
                iconSize: _iconSize,
                onPressed: () {
                  print('클릭1');
                },
                icon: Icon(Icons.notifications, color: Colors.white,),
              ),
              IconButton(
                iconSize: _iconSize,
                onPressed: () {
                  print('클릭2');
                },
                icon: Icon(Icons.search, color: Colors.white,),
              ),
              SizedBox(
                height: _iconSize,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.namu.wiki/i/o5lE3DhCB9NCYp_AzyPszyOblhB7JDtoWaFiV6H3NNUpKxiwyRaG0fn_XEWzc43fv5uI2cV4EDOrMth9tsbslA.webp'),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
            floating: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(10, 60, 0, 0),
              child: SizedBox(
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[800],
                      ),
                      child: Center(child: Icon(Icons.explore, color: Colors.white,)),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            smallTags.length,
                            (index) => Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: SizedBox(
                                width: 60,
                                height: 35,
                                child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey[800],
                                      ),
                                      child: Center(child: Text(smallTags[index], style: TextStyle(color: Colors.white),)),
                                    ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            expandedHeight: 105,

          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => VideoCard(),
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
