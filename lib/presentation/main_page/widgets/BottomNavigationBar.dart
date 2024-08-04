import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ValueNotifier<int> indexNotifierValue = ValueNotifier(0);

class Bottomnavigationbar extends StatelessWidget {
  const Bottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifierValue,
        builder: (context, int newIndex, _) {
          print("value_-$indexNotifierValue");
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            elevation: 0,
            backgroundColor: Colors.black,
            onTap: (index) {
              indexNotifierValue.value = index;
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            unselectedIconTheme: IconThemeData(color: Colors.grey[700]),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections),
                label: 'News & Hot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Downloads',
              ),
            ],
          );
        });
  }
}
