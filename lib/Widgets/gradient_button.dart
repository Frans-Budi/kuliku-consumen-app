import 'package:flutter/material.dart';
import 'package:kuliku/utils/colors.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  final Border? border;

  const GradientButton({
    Key? key,
    required this.child,
    this.gradient = AppColors.primaryGradient,
    this.width = double.infinity,
    this.height,
    required this.onTap,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(100),
        border: border,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey[500],
        //     offset: Offset(0.0, 1.5),
        //     blurRadius: 1.5,
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
