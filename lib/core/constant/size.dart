import 'package:bocchi_guitar_hub_client/core/constant/reference/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

class Sizes {
  // フォントサイズ
  static double fontSmall(BuildContext context) =>
      _getSize(context, 12, 14, 16);
  static double fontNormal(BuildContext context) =>
      _getSize(context, 16, 18, 20);
  static double fontLarge(BuildContext context) =>
      _getSize(context, 20, 22, 24);

  // アイコンサイズ
  static double iconSmall(BuildContext context) =>
      _getSize(context, 16, 20, 24);
  static double iconNormal(BuildContext context) =>
      _getSize(context, 24, 28, 32);
  static double iconLarge(BuildContext context) =>
      _getSize(context, 42, 46, 50);

  // ページビューで表示する範囲
  static double viewportFraction(BuildContext context) =>
      _getSize(context, 0.5, 0.3, 0.2);

  static double _getSize(
      BuildContext context, double mobile, double tablet, double desktop) {
    final deviceType = ResponsiveBreakpoints.getDeviceType(context);
    switch (deviceType) {
      case DeviceSizeType.mobile:
        return mobile;
      case DeviceSizeType.tablet:
        return tablet;
      case DeviceSizeType.desktop:
        return desktop;
    }
  }
}
