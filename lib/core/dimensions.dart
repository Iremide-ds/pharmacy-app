import 'package:flutter/material.dart';

class AppDimensions {
  static final double deviceHeight =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
  static final double deviceWidth =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;

  static const double appBarBorderRadius = 20;
  static const double borderRadius1 = 10;
  static const double borderRadius2 = 10.95;
  static const double borderRadius3 = 50;

  static final double childAspectRatio = ((deviceWidth / (deviceWidth * 0.15)) /
          (deviceHeight / (deviceHeight * 0.19))) *
      0.5;

  static final double height1 = deviceHeight * 0.22;
  static final double width1 = deviceWidth;

  static const double fontSize1 = 22;
  static const double fontSize2 = 18;
  static const double fontSize3 = 16;
  static const double fontSize4 = 14;
  static const double fontSize5 = 14.46;
  static const double fontSize6 = 12;
}
