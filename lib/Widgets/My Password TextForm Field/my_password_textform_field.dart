import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/constants.dart';

class MyPasswordTextFormField extends GetView {
  @override
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillcolor;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? togglePasswordView;

  const MyPasswordTextFormField(
      {super.key,
      this.maxLines,
      this.contentPadding,
      this.fontWeight,
      this.controller,
      this.width,
      this.height,
      this.padding,
      this.hintText,
      this.labelText,
      this.labelTextColor,
      this.hintTextColor,
      this.fillcolor,
      required this.obscureText,
      this.validator,
      this.onTap,
      this.togglePasswordView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.fromLTRB(44.w, 16.h, 45.w, 0),
      child: SizedBox(
        width: width ?? 286.w,
        // height: height ?? 43.w,
        child: TextFormField(
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              letterSpacing: 0.05),
          textAlign: TextAlign.left,
          onTap: onTap,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines ?? 1,
          controller: controller,
          decoration: InputDecoration(
            // enabledBorder: InputBorder.none,
            errorStyle: GoogleFonts.ubuntu(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            filled: true,
            contentPadding:
                contentPadding ?? EdgeInsets.fromLTRB(25.w, 13.h, 0.w, 13.h),

            suffix: GestureDetector(
                onTap: togglePasswordView,
                child: obscureText
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 17.w, 0),
                        child: const Icon(Icons.visibility_off_sharp),
                      )
                    : Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 17.w, 0),
                        child: const Icon(Icons.visibility_sharp),
                      )

                // Icon(
                //   obscureText
                //       ? Icons.visibility
                //       : Icons.visibility_off,
                // )

                ),

            labelStyle: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,

                // color: secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: HexColor('#B6B6B6')),
            hintStyle: TextStyle(
              color: hintTextColor ?? HexColor("#555555"),
              fontWeight: FontWeight.w400,
            ),
            hintText: hintText,
            // labelText: labelText,
            fillColor: fillcolor ?? HexColor('#EEEEEE'),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: HexColor('#EEEEEE'), width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
