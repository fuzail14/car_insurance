import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/constants.dart';

class MyElipse extends StatelessWidget {
  const MyElipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        width: 16.w,
        height: 16.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
      ),
    );
  }
}
