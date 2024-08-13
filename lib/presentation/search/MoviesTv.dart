import 'package:flutter/widgets.dart';

class MovieResult extends StatelessWidget {
  const MovieResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Movies and TV'),
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 3,
            childAspectRatio: 1 / 2,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(
              2,
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
    // return Container(
    //   height: 50,
    //   width: 50,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: NetworkImage(kimg[0]),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
    return const Text("text");
  }
}
