import 'dart:math';

import 'package:ecomy/presentation/common/constants.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Newsandhot extends StatelessWidget {
  const Newsandhot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(width: 30, height: 30, color: Colors.blue),
            ],
            bottom: const TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              indicator: BoxDecoration(
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  text: "❤ Love",
                ),
                Tab(
                  text: "💋 Kiss",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [_funcCommon(context), Text('hello')]),
      ),
    );
  }

  Widget _funcCommon(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 500,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'FEB',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '11',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          'https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          radius: 22,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_off,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('TAll girl'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
