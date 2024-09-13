/*
 * @Author: christyastama
 * @Date: 12/09/24 at 21.12
 */
import 'dart:ui';

import 'package:flutter/material.dart';

/// CONFIGS DATA
class XConfig {
  /// APP CONFIG
  static const String appName = "Klontong21";
  static const baseUrl = "https://crudcrud.com/";
  static const apiKey = "62d71d841c1744579b9245923363d477";
}

class XSpace {
  /// Padding
  static const double paddingZero = 0.0;
  static const double paddingXS = 2.0;
  static const double paddingS = 4.0;
  static const double paddingM = 8.0;
  static const double paddingL = 16.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 36.0;

  /// Margin
  static const double marginZero = 0.0;
  static const double marginXS = 2.0;
  static const double marginS = 4.0;
  static const double marginM = 8.0;
  static const double marginL = 16.0;
  static const double marginXL = 32.0;

  /// Spacing
  static const double spaceXXS = 1.0;
  static const double spaceXS = 2.0;
  static const double spaceS = 4.0;
  static const double spaceM = 8.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 32.0;
}

class XColor {
  /// Common Colors
  static const primaryColor = Color(0xFF009AC4);
  static const mistyColor = Color(0xFFE0E0E0);
  static const lightBgColor = Color(0xffFDFCFF);
  static const bgColor = Color(0xffFFFFFF);
  static const accentColor = Color(0xFF025B99);
  static const primaryVariant = Color(0xFF4185FF);
  static const primaryVariantLight = Color(0xFFE8F5E9);
  static const primarySwatch = Color(0xFFf2994b);
  static const primaryContainer = Color(0xFFCAFDFF);
  static const inputBgColor = Color(0xFFF1F0F4);
  static const surface = Color(0xFFFDFCFF);
  static const outlineVariant = Color(0xFFDFE3EB);

  static const iconColor = Colors.white;
  static const textColor = Color(0xFF000000);
  static const buttonColor = primaryColor;
  static const textButtonColor = Colors.white;

  static const primaryDarkColor = Color(0xFF014472);
  static const darkBgColor = Color(0xFF232425);
  static const iconColorDark = Colors.white;
  static const textColorDark = Color(0xFFffffff);
  static const buttonColorDark = primaryDarkColor;
  static const textButtonColorDark = Colors.black;
  static const primaryContainerDark = Color(0xFFD0E4FF);
  static const surfaceVariant = Color(0xFFDFE3EB);
  static const warningLight = Color(0xFF7D5700);
  static const extendsWarning = Color(0xFFFFBB33);

  /// error
  static const errorContainer = Color(0xFFFFDAD6);
}
