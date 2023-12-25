import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyStatusWidget extends GetView {
  final String status;
  final Color color;
  final Color textcolor;

  final double? width;
  final double? height;

  MyStatusWidget(
      this.status, this.color, this.textcolor, this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 64,
      height: height ?? 18,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 10,
            color: textcolor ?? HexColor('#FFFFFF'),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
