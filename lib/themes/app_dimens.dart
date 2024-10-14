import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimens {
  static double size10 = 12.sp;
  static double size14 = 14.sp;
  static double size16 = 16.sp;
  static double size18 = 18.sp;
  static double size20 = 20.sp;
  static double size22 = 22.sp;
  static double size24 = 24.sp;
  static double size40 = 40.sp;

  static double iconNormalSize = 20.sp;
  static double iconBigSize = 30.sp;

  static double border = 8.sp;

  static double maxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double maxHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;
}
