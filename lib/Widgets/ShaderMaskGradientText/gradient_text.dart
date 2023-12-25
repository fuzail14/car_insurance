import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

// ignore: must_be_immutable
class GradientText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  GradientText({required this.text, this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [primaryColor, primaryColor2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
