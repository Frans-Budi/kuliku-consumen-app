import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/gradient_button.dart';
import 'package:kuliku/Widgets/small_text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.paddingTop),
        child: Stack(
          children: [
            // Image OnBoarding
            Image.asset(
              "assets/images/onBoarding_image.png",
              width: double.infinity,
            ),
            // Bottom Task
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 340,
                width: double.maxFinite,
                color: AppColors.whiteColor,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
                child: Column(
                  children: [
                    // Judul
                    BigText(
                      text: "Bangun Rumah Semudah Sentuhan Jari",
                      size: Dimensions.font24,
                      maxLine: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimensions.height8),
                    // Keterangan
                    SmallText(
                      text:
                          "Cari kontraktor dan jasa renovasi terbaik untuk memulai hidup baru di area impianmu.",
                      maxLine: 2,
                      size: Dimensions.font16,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimensions.height10 * 3),
                    // Masuk
                    GradientButton(
                      onTap: () => Get.toNamed(Routes.LOGIN_SCREEN),
                      height: Dimensions.height10 * 5,
                      child: SmallText(
                        text: "Masuk",
                        color: AppColors.whiteColor,
                        size: Dimensions.font16,
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    GradientButton(
                      onTap: () => Get.toNamed(Routes.REGISTER_SCREEN),
                      gradient: AppColors.whiteGradient,
                      border: Border.all(color: AppColors.borderColor),
                      height: Dimensions.height10 * 5,
                      child: SmallText(
                        text: "Daftar",
                        color: AppColors.textBlack,
                        size: Dimensions.font16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
