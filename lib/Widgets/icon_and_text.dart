import 'package:flutter/material.dart';
import 'package:kuliku/Widgets/small_Text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconAndText({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        Icon(
          icon,
          size: Dimensions.font24,
          color: AppColors.darkGrayColor,
        ),
        SizedBox(width: Dimensions.height12 / 2),
        // text
        SmallText(
          text: text,
          color: AppColors.textGray,
          size: Dimensions.font16,
        ),
      ],
    );
  }
}
