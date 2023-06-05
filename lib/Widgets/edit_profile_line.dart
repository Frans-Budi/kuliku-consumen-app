import 'package:flutter/material.dart';
import 'package:kuliku/Widgets/small_Text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class EditProfileLine extends StatelessWidget {
  final String title;
  final String text;
  final IconData? icon;
  final Function()? onTap;

  const EditProfileLine({
    super.key,
    required this.title,
    required this.text,
    this.icon = Icons.arrow_forward_ios_rounded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallText(
          text: title,
          size: Dimensions.font16,
          color: AppColors.darkGrayColor,
        ),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: Dimensions.screenWidth * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SmallText(
                    text: text,
                    size: Dimensions.font16,
                    color: AppColors.textBlack,
                  ),
                ),
                Icon(
                  icon,
                  size: Dimensions.iconSize16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
