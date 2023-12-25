import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Constants/constants.dart';

class listViewCard extends StatelessWidget {
  listViewCard(
      {this.eventCardDesginImg,
      this.showeventCardDesginImg = true,
      required this.title,
      required this.description,
      this.showButtons = true, // Add a flag for showing buttons
      this.onPressedofAddImage,
      this.onPressedofViewImage,
      required this.DeleteDialogPress,
      required this.updateOnPressed,
      required this.startdate,
      required this.enddate,
      this.gradientColors = const [],
      this.iconColor,
      this.startDatecolor,
      this.endDatecolor});
  String? eventCardDesginImg;

  String? title;
  String? description;
  bool showButtons;
  bool showeventCardDesginImg;
  List<Color> gradientColors;

  void Function()? onPressedofAddImage;
  void Function()? onPressedofViewImage;
  void Function()? DeleteDialogPress;
  void Function()? updateOnPressed;
  String? startdate;
  String? enddate;
  Color? iconColor;
  Color? startDatecolor;
  Color? endDatecolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Color.fromRGBO(187, 187, 187, 0.3),
          width: 0.3.w,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(50, 50, 71, 0.08),

            blurRadius: 32,
            offset: Offset(0, 24), // changes position of shadow
          ),
        ],
        color: HexColor('#FFFFFF'),
      ),
      child: Stack(
        children: [
          if (showeventCardDesginImg)
            Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  eventCardDesginImg!,
                  color: primaryColor,
                )),
          //TITLE
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 12.h),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  color: HexColor('#404345'),
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0015,
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500),
            ),
          ),
          //DESCRIPTION
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 39.w),
            child: Text(
              description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  fontStyle: FontStyle.normal,
                  color: HexColor("#AAAAAA"),
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.w400),
            ),
          ),

          //Add And View Image Buttons
          // Conditionally show buttons
          Padding(
            padding:
                EdgeInsets.only(left: (showButtons) ? 21.w : 257, top: 65.h),
            child: Row(
              children: [
                // if (showButtons) ...[
                //   MyButton(
                //       borderRadius: BorderRadius.circular(5.r),
                //       width: 80.w,
                //       textColor: primaryColor,
                //       fontWeight: FontWeight.w400,
                //       fontSize: ScreenUtil().setSp(10),
                //       height: 22.h,
                //       name: 'AddImage',
                //       color: HexColor('#E8E8E8'),
                //       elevation: 0,
                //       onPressed: onPressedofAddImage),
                //   8.pw,
                // ],
                // if (showButtons) ...[
                //   MyButton(
                //     elevation: 0,
                //     textColor: Colors.white,
                //     fontWeight: FontWeight.w400,
                //     width: 85.w,
                //     height: 22.h,
                //     borderRadius: BorderRadius.circular(8.r),
                //     fontSize: ScreenUtil().setSp(10),
                //     name: 'View Image',
                //     color: primaryColor,
                //     onPressed: onPressedofViewImage,
                //   ),
                //   42.pw,
                // ],
                Spacer(),
                Container(
                  height: 22.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: primaryColor),
                  child: IconButton(
                    icon: SvgPicture.asset("assets/delete_noticboard_icon.svg",
                        height: 13.h, width: 12.w),
                    onPressed: () {},
                  ),
                ),
                6.pw,
                Container(
                  height: 22.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: primaryColor),
                  child: IconButton(
                    icon: SvgPicture.asset("assets/edit_icon.svg",
                        height: 13.h, width: 12.w),
                    onPressed: updateOnPressed,
                  ),
                ),
                20.pw,
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 21.w,
              right: 20.w,
              top: 95.h,
              bottom: 8.h,
            ),
            child: Container(
              width: 286.w,
              height: 34.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  gradient: LinearGradient(
                      // 10% of the width, so there are ten blinds.

                      colors: gradientColors // red to yellow
                      // tileMode: TileMode.repeated, // repeats the gradient over the canvas
                      )),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 14.w,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: ScreenUtil().setWidth(20),
                      color: iconColor ?? HexColor('#FFFFFF'),
                    ),
                    14.pw,
                    Text(startdate!,
                        style: GoogleFonts.ubuntu(
                          color: startDatecolor ?? HexColor('#FFFFFF'),
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0015,
                          fontSize: ScreenUtil().setSp(14),
                        )),
                    26.pw,
                    SvgPicture.asset(
                      "assets/event_arrow.svg",
                    ),
                    27.pw,
                    Text(enddate!,
                        style: GoogleFonts.ubuntu(
                          color: endDatecolor ?? HexColor('#FFFFFF'),
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0015,
                          fontSize: ScreenUtil().setSp(14),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
