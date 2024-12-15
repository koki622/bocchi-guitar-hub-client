import 'package:flutter/material.dart';

enum DeviceSizeType { mobile, tablet, desktop }

class ResponsiveBreakpoints {
  static const double mobileMaxWidth = 767;
  static const double tabletMaxWidth = 1279;

  /// デバイスの種類を判定するメソッド
  static DeviceSizeType getDeviceType(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= mobileMaxWidth) {
      return DeviceSizeType.mobile;
    } else if (screenWidth <= tabletMaxWidth) {
      return DeviceSizeType.tablet;
    } else {
      return DeviceSizeType.desktop;
    }
  }
}
