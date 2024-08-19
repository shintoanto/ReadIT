import 'dart:ffi'as ffi;
import 'dart:math' as pi;
import 'dart:ui';

import 'package:ecomy/presentation/card/flutter_animated_card.dart';
import 'package:ecomy/presentation/common/constants.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:ecomy/presentation/common/main_title.dart';
import 'package:ecomy/presentation/pdf_reading/manga_pdf_reading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {

  var urlArge;

  _Homepage();

  @override
  void initState() {
    super.initState();
  }

  // dispose status bar
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: ScrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                ScrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                ScrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      children: <Widget>[

                        Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(

                                  colors: [Colors.white, Colors.white70],
                                  stops: [0.8, 0.2],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: SizedBox(height: 600,
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/goju.jpg",
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "List",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  _PlayButton(),
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "List",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MainTitleCard(
                          titles: "Released",
                          urls: urlArge,
                        ),
                        MainTitleCard(
                          titles: "Trending Now",
                          urls: urlArge,
                        ),
                        const NumberCard(index: 3)
                      ],
                    ),
                  ],
                ),
                ScrollNotifier.value == true ? _firstHomeBar() : kHight,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _firstHomeBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: double.infinity,
        height: 60,
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: [
            Row(
              children: [
                kWidth,
                Image.asset(
                  "assets/naruto_symbol.png",
                  height: 50,
                  width: 50,
                ),
                const Spacer(),
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(width: 30, height: 30, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () => {},
      icon: const Icon(
        Icons.book,
        size: 25,
        color: Colors.black,
      ),
      iconAlignment: IconAlignment.start,
      label: const Text(
        'Read',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );
  }
}

class MainTitleCard extends StatelessWidget {
  MainTitleCard({super.key, required this.titles, required this.urls});

  String titles;
  var urls;
  var imgLit = [
    'assets/berserk2.jpeg',
    'assets/demo1.jpeg',
    'assets/aot3.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: titles),
        kHight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MainCard(index: index, img: imgLit);
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  MainCard({
    super.key,
    required this.index,
    required this.img,
  });

  int index;
  var img = [];
  var pdfList = ['assets/demon_slayer.pdf', 'assets/berserk_vol1.pdf'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimatedCards(
                index: index,
                pdfList: pdfList[index],
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(20),
          width: 150,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(img[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 130,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 30,
          bottom: 0,
          child: Text(
            '$index',
            style: const TextStyle(
              fontSize: 120,
              decoration: TextDecoration.none,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
