import 'package:flutter/material.dart';
import 'package:kuliku/utils/colors.dart';

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star_rounded : Icons.star_border_rounded,
          color: AppColors.starColor,
        );
      }),
    );
  }
}
