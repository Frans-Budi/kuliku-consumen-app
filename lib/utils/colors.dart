import 'package:flutter/material.dart';

class AppColors {
  // Color
  static const Color primaryColor = Color(0XFF6B4EFF);
  static const Color softPurple = Color(0XFFF1F1FE);
  static const Color whiteColor = Color(0XFFffffff);
  static const Color grayColor = Color(0XFFE3E3E7);
  static const Color darkGrayColor = Color(0XFF7D7F88);
  static const Color blackColor = Color(0XFF000000);
  static const Color textBlack = Color(0XFF1A1E25);
  static const Color textGray = Color(0XFF7D7F88);
  static const Color backgroundColor = Color(0XFFF2F2F3);
  static const Color backgroundActivity = Color(0XFFFCFCFC);
  static const Color borderColor = Color(0XFFE3E3E7);
  static const Color shadowColor = Color(0XFF434343);
  static const Color starColor = Color(0XFFFFBF75);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0XFF917AFD), Color(0XFF6246EA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0XFFF2F2F3), Color(0XFFF2F2F3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient transparentGradient = LinearGradient(
    colors: [Colors.transparent, Colors.transparent],
  );
  static const LinearGradient whiteGradient = LinearGradient(
    colors: [Colors.white, Colors.white],
  );

  // BoxShadow
  static List<BoxShadow> basicShadow = [
    BoxShadow(
      color: AppColors.shadowColor.withOpacity(0.2),
      blurRadius: 10,
      spreadRadius: 2,
    )
  ];
}
