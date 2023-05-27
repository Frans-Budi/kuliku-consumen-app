import 'package:flutter/material.dart';
import 'package:kuliku/Widgets/small_Text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class BasicListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData leadingIcon;

  const BasicListTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
          vertical: Dimensions.height8, horizontal: Dimensions.height16),
      leading: Container(
        padding: EdgeInsets.all(Dimensions.height8),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: AppColors.basicShadow,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: Icon(
          leadingIcon, // leadingIcon
          color: AppColors.blackColor,
        ),
      ),
      title: SmallText(
        text: text, // <-- Text
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
        size: Dimensions.font16,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios, // <-- trailingIcon
        size: Dimensions.height10 * 2,
      ),
    );
  }
}
