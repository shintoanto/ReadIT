import 'package:ecomy/presentation/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.montserratAlternates(
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(width: 30, height: 30, color: Colors.blue),
      ],
    );
  }
}
