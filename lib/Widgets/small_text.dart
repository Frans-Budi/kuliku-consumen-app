import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? lineHeight;

  const SmallText({
    super.key,
    required this.text,
    this.color = AppColors.textGray,
    this.size = 0,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine = 1,
    this.textAlign = TextAlign.start,
    this.lineHeight = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size == 0 ? Dimensions.font14 : size,
        height: lineHeight,
      ),
    );
  }
}
