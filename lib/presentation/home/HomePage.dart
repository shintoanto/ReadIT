import 'package:ecomy/presentation/common/constants.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:ecomy/presentation/common/main_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GeneralAppBar(
          title: 'Home',
        ),
      ),
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
                            Container(
                              height: 600,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.imdb.com/title/tt7510222/mediaviewer/rm1310030849/?ref_=tt_ov_i"),
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
                        const MainTitleCard(titles: "Released"),
                        const MainTitleCard(titles: "Trending Now"),
                        NumberCard(index: 3)
                      ],
                    ),
                  ],
                ),
                ScrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 60,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg",
                                  height: 50,
                                  width: 50,
                                ),
                                Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                    width: 30, height: 30, color: Colors.blue),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHight,
              ],
            ),
          );
        },
      ),
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () => {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: Colors.black,
      ),
      iconAlignment: IconAlignment.start,
      label: const Text(
        'Play',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );
  }
}

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.titles});
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: titles),
        kHight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
              "https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg"),
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  NumberCard({super.key, required this.index});
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
                      "https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg"),
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
