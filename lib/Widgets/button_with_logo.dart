import 'package:flutter/material.dart';
import 'package:kuliku/Widgets/small_text.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

class ButtonWithLogo extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final Widget logo;
  final VoidCallback onTap;

  const ButtonWithLogo({
    super.key,
    required this.text,
    this.textColor,
    this.buttonColor,
    required this.logo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: Dimensions.height10 * 5,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 0.8),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.height16),
                  child: logo, // <--
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SmallText(
                  text: text, // <--
                  color: textColor, // <--
                  size: Dimensions.font16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
