import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.volume_mute),
              ),

              // Left side data
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchTitle extends StatelessWidget {
  const SearchTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
