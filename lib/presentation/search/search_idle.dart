import 'package:ecomy/presentation/common/constants.dart';
import 'package:ecomy/presentation/search/MoviesTv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bgImg =
    'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/mOlEbXcb6ufRJKogI35KqsSlCfB.jpg';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.3),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHight,
              const Text(
                'Top Searches',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              kHight,
              const MovieResult(),
              // Expanded(
              //   child: ListView.separated(
              //       shrinkWrap: true,
              //       //scrollDirection: Axis.horizontal,
              //       itemBuilder: (ctx, index) {
              //         return const TopSearchItemSeperated();
              //       },
              //       separatorBuilder: (ctx, index) => kHight,
              //       itemCount: bgImg.length),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class TopSearchItemSeperated extends StatelessWidget {
  const TopSearchItemSeperated({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Row(
        children: [
          Container(
            width: screenwidth * 0.3,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(bgImg),
              ),
            ),
          ),
          const Expanded(
              child: Text(
            'movie name',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const CircleAvatar(
            backgroundColor: kWhite,
            maxRadius: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                CupertinoIcons.play,
                color: kWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
