import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class FontConstants {
  static const String fontFamilyBold = "AlexandriaFLF-Bold";
  static const String fontFamilyMedium = "AlexandriaFLF";
  static const String fontFamilyMediumItalic = "AlexandriaFLF-Italic";
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class TextStyles {
  static TextStyle textXLarge = TextStyle(
      fontSize: 24.sp,
      color: const Color(ColorCode.primary),
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.fontFamilyBold);

  static TextStyle textSemiBold = TextStyle(
      fontSize: 24.sp,
      color: const Color(ColorCode.primary),
      fontWeight: FontWeightManager.semiBold,
      fontFamily: FontConstants.fontFamilyMedium);

  static TextStyle textMedium = TextStyle(
      fontSize: 24.sp,
      color: const Color(ColorCode.primary),
      fontWeight: FontWeightManager.medium,
      fontFamily: FontConstants.fontFamilyMedium);

  static TextStyle textMediumItalic = TextStyle(
      fontSize: 16.sp,
      color: const Color(ColorCode.primary),
      fontWeight: FontWeightManager.medium,
      fontFamily: FontConstants.fontFamilyMediumItalic);

  static TextStyle textRegular = TextStyle(
      fontSize: 16.sp,
      color: const Color(ColorCode.primary),
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamilyMedium);
}
