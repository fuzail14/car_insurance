import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/constants.dart';

class ComplainDialogBorderWidget extends StatelessWidget {
  final String? text;

  const ComplainDialogBorderWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82.w,
      height: 25.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(color: primaryColor)),
      child: Center(
        child: Text(
          text ?? "",
          style: GoogleFonts.ubuntu(
            color: HexColor('#535353'),
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
