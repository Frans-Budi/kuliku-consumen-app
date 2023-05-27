import 'package:flutter/material.dart';
import 'package:kuliku/utils/colors.dart';

class LoadingActivity extends StatelessWidget {
  const LoadingActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor.withOpacity(0.3),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.whiteColor,
            boxShadow: AppColors.basicShadow,
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
