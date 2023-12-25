import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import '../ShaderMaskGradientText/gradient_text.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;

  final void Function()? onTap;

  const MyBackButton({
    this.text,
    this.widget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 10,
      ).r,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              child: SvgPicture.asset(
                "assets/images/back.svg",
                width: 26.w,
              ),
            ),
          ),
          20.w.pw,
          GradientText(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            text: text!,
          ),
          50.pw,
          Container(
            child: widget,
          )
        ],
      ),
    );
  }
}
