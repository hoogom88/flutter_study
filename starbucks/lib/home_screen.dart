import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 320,
          toolbarHeight: 40,
          titleSpacing: 0,

          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(start: 24, bottom: 0),
            expandedTitleScale: 1,
            background: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://src.hidoc.co.kr/image/lib/2019/3/21/20190321174958927_0.jpg',
                      height: 230,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.white,
                              Colors.white,
                              Color.fromRGBO(255, 255, 255, 0)
                            ])),
                      ),
                      bottom: -15,
                      right: 0,
                    ),
                    Positioned(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 8, 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '내용 보기',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 13),
                              ),
                              Text(''),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        ),
                      bottom: -5,
                      right: 0,
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 20, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('1★until Green Level', style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              LinearProgressIndicator(
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(15),
                                backgroundColor: Colors.grey[500],
                                value: 0.75,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              '4',
                              style: TextStyle(fontSize: 35, height: 0.1),
                            ),
                            Text('/5★', style: TextStyle(fontSize: 20, color: Colors.grey[500], height: 1)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.mail_outline, color: Colors.grey[500],),
                SizedBox(
                  width: 6,
                  height: 40,
                ),
                Text(
                  'What\'s New',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 24,
                ),
                Icon(Icons.airplane_ticket_outlined, color: Colors.grey[500]),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Coupon',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[700]),
                ),
                Spacer(),
                Icon(Icons.add_alert_outlined, color: Colors.grey[500]),
                SizedBox(width: 20)
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
