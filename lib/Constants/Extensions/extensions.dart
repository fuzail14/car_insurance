import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension sizedBoxExt on num {
  SizedBox get ph => SizedBox(height: ScreenUtil().setHeight(toDouble()));
  SizedBox get pw => SizedBox(width: ScreenUtil().setWidth(toDouble()));

  dynamic get font => ScreenUtil().setSp(toDouble());
}
