import 'package:ecomy/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:ecomy/presentation/fasl_laugh/videoListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fastlaugh extends StatelessWidget {
  const Fastlaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context)
          .add(const FastLaughEvent.initialize());
    });
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GeneralAppBar(
          title: 'Fast laugh',
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
            builder: (context, state) {
          if (state.isError) {
          } else if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView(
            scrollDirection: Axis.vertical,
            children: [
              ...List.generate(
                state.videoList.length,
                (inde) {
                  return VideoListInheritedItems(
                    widget: VideoListItem(
                      key: Key(
                        inde.toString(),
                      ),
                      index: inde,
                    ),
                    movieDataclass: state.videoList[inde],
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
