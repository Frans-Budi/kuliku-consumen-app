import 'package:flutter/material.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow overflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? lineHeight;

  const BigText({
    super.key,
    required this.text,
    this.color = AppColors.textBlack,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine = 1,
    this.textAlign = TextAlign.start,
    this.lineHeight = 1.5,
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
        fontWeight: FontWeight.w700,
        fontSize: size == 0 ? Dimensions.font18 : size,
        height: lineHeight,
      ),
    );
  }
}
