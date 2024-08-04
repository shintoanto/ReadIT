import 'package:ecomy/common_widgets/app_bar_widget.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:ecomy/presentation/fasl_laugh/videoListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fastlaugh extends StatelessWidget {
  const Fastlaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GeneralAppBar(
          title: 'Fast laugh',
        ),
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            ...List.generate(
              10,
              (inde) {
                return VideoListItem(
                  index: inde,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
