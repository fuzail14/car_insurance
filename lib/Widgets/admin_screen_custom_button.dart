import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';

// ignore: must_be_immutable
class AdminScreenContainer extends StatelessWidget {
  AdminScreenContainer(
      {super.key, required this.onTap, required this.icon, required this.text});
  void Function()? onTap;
  String? icon;
  String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72.h,
        width: 148.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).w,
          gradient: LinearGradient(colors: [primaryColor, primaryColor2]),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(16),
                top: ScreenUtil().setHeight(16),
              ),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                image:
                    DecorationImage(image: AssetImage(icon!), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(8),
                top: ScreenUtil().setHeight(26),
              ),
              child: AutoSizeText(
                text!,
                style: GoogleFonts.ubuntu(
                    fontSize: ScreenUtil().setSp(12),
                    fontStyle: FontStyle.normal,
                    color: HexColor('#FFFFFF'),
                    fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
