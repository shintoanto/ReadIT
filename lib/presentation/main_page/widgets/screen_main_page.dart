import 'package:ecomy/main.dart';
import 'package:ecomy/presentation/downloads/widgets/screen_downloads.dart';
import 'package:ecomy/presentation/fasl_laugh/FastLaugh.dart';
import 'package:ecomy/presentation/home/HomePage.dart';
import 'package:ecomy/presentation/main_page/widgets/BottomNavigationBar.dart';
import 'package:ecomy/presentation/news_and_hot/newsandhot.dart';
import 'package:ecomy/presentation/search/search_idle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    Homepage(),
    //  Fastlaugh(),
    Newsandhot(),
    SearchIdle(),
    DownloadsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: indexNotifierValue,
        builder: (context, int index, _) {
          return _pages[index];
        },
      )),
      bottomNavigationBar: const Bottomnavigationbar(),
    );
  }
}
