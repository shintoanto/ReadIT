import 'package:ecomy/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListInheritedItems extends InheritedWidget {
  final Widget widget;
  final Downloads movieDataclass;
  const VideoListInheritedItems(
      {super.key, required this.widget, required this.movieDataclass})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInheritedItems oldWidget) {
    // ignore: unnecessary_null_comparison
    return oldWidget.movieDataclass != null;
  }

  static VideoListInheritedItems? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedItems>();
  }
}

final _videUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath = VideoListInheritedItems.of(context)?.movieDataclass.url;
    return Stack(
      children: [
        VideoPlayerWidget(
          videoUrl: _videUrls[index],
          onStateChanged: (bool) {},
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
                    foregroundImage:
                        posterPath == null ? null : NetworkImage(posterPath),
                    backgroundColor: Colors.amber,
                  ),
                  GestureDetector(
                    onTap: () {
                      final shi = VideoListInheritedItems.of(context)
                          ?.movieDataclass
                          .url;

                      if (shi != null) {
                        Share.share(shi);
                      }
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideoIdsNotifier,
                    builder: (BuildContext c, Set<int> newLikedListId,Widget? _) {
                      final _index = index;
                      if (newLikedListId.contains(index)) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<FastLaughBloc>(context).add(
                              LikeVideo(id: index),
                             );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                          ),
                        );
                      }
                      return const CircleAvatar(
                        backgroundColor: Colors.cyan,
                      );
                    },
                  ),
                  const CircleAvatar(
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

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  void Function(bool isPlaying) onStateChanged;
  VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
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
