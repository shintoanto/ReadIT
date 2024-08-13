import 'dart:math';

import 'package:ecomy/application/downloads/downloads_bloc.dart';
import 'package:ecomy/presentation/common/constants.dart';
import 'package:ecomy/presentation/common/gen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GeneralAppBar(
          title: 'Downloads',
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) => _widgetList[index],
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: _widgetList.length)),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final images = [
    "https://resizing.flixster.com/eIGDgGTAbtVm_PFc-_I_AdQnoyI=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvYWIxYTAyYzItZWEwNy00YjM4LTkxODMtN2E4ZDE0ZmZmNWZkLmpwZw==",
    "https://m.media-amazon.com/images/I/91MKteX6XBL._SL1500_.jpg",
    "https://th.bing.com/th/id/OIP.jQMllXgr_VFns9AisU6mDgHaLJ?rs=1&pid=ImgDetMain"
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHight,
        const Text(
          'We will download a personalised selection of \n movies and shows for you. so there is \n always something to watch on your \n device',
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // add loadig bar circular
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            radius: size.width * 0.40,
                          ),
                        ),

                        // aot
                        Padding(
                          padding: const EdgeInsets.only(right: 160, top: 30),
                          child: Transform.rotate(
                            angle: -25 * pi / 180,
                            child: Container(
                              // margin: const EdgeInsets.only(right: 140, bottom: 45),
                              width: size.width * 0.35,
                              height: size.width * 0.55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    '${state.downloads?[0].url}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 160, top: 30),
                          child: Transform.rotate(
                            angle: 25 * pi / 180,
                            child: Container(
                              width: size.width * 0.35,
                              height: size.width * 0.55,
                              //margin: const EdgeInsets.only(left: 140, bottom: 45),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    '${state.downloads?[1].url}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // samu
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Transform.rotate(
                            angle: 0 * pi / 180,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              width: size.width * 0.4,
                              height: size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '${state.downloads?[2].url}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHight,
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.green[50],
          textColor: Colors.white,
          child: const Text(
            'See What You Can Download',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
