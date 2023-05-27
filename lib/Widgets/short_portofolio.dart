import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuliku/Widgets/small_Text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';

class ShortPortofolio extends StatelessWidget {
  final String category;
  final Widget icon;
  final int? quantity;

  const ShortPortofolio({
    super.key,
    required this.category,
    required this.icon,
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        icon,
        SizedBox(width: Dimensions.height10),
        // Category & quantity
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: category,
              size: Dimensions.font16,
            ),
            SizedBox(height: Dimensions.height8 / 2),
            SmallText(
              text: "${quantity}x",
              size: Dimensions.font16,
            ),
          ],
        ),
      ],
    );
  }
}
