

import 'package:ecomy/presentation/downloads/widgets/screen_downloads.dart';
import 'package:ecomy/presentation/home/HomePage.dart';
import 'package:ecomy/presentation/main_page/widgets/BottomNavigationBar.dart';
import 'package:ecomy/presentation/pdf_reading/manga_pdf_reading.dart';
import 'package:ecomy/presentation/search/search_idle.dart';
import 'package:flutter/material.dart';



class ScreenMainPage extends StatelessWidget {




  ScreenMainPage( {super.key});

  final _pages = [
     Homepage(),
     MangaPdfReading(pdfPath: 'assets/berserk_vol1.pdf'),
    // Fastlaugh(),
    //  Newsandhot(),
    const SearchIdle(),
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
