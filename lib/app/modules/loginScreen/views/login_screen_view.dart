import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/button_with_logo.dart';
import 'package:kuliku/Widgets/gradient_button.dart';
import 'package:kuliku/Widgets/loading_activity.dart';
import 'package:kuliku/Widgets/small_text.dart';
import 'package:kuliku/Widgets/text_input.dart';
import 'package:kuliku/Widgets/text_input_password.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundActivity,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundActivity,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              splashRadius: Dimensions.radius25,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.blackColor,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
              child: ListView(
                children: [
                  // Judul
                  BigText(
                    text: "Selamat Datang kembali!",
                    size: Dimensions.font24,
                  ),
                  SizedBox(height: Dimensions.height8),
                  // Keterangan
                  const SmallText(
                    text:
                        "Temukan kontraktor terbaik dan jasa renovasi berkualitas di KuliKu! Nikmati renovasi rumah yang efesien dan lancar dengan para ahli terpercaya tersedia disini!",
                    maxLine: 4,
                    lineHeight: 1.5,
                  ),
                  SizedBox(height: Dimensions.height16),

                  // Input Email
                  SmallText(
                    text: "Email",
                    size: Dimensions.font16,
                    color: AppColors.textBlack,
                  ),
                  SizedBox(height: Dimensions.height8),
                  TextInput(
                    controller: controller.emailC,
                    prefixIcon: const Icon(Icons.email_rounded),
                    hintText: "Masukkan email Anda di sini",
                    keyboardType: TextInputType.emailAddress,
                    inputFormatter: "email",
                  ),
                  SizedBox(height: Dimensions.height16),

                  // Input Password
                  SmallText(
                    text: "Password",
                    size: Dimensions.font16,
                    color: AppColors.textBlack,
                  ),
                  SizedBox(height: Dimensions.height8),
                  TextInputPassword(
                    controller: controller.passC,
                    prefixIcon: const Icon(Icons.key_sharp),
                    hintText: "Masukkan sandi Anda di sini",
                  ),
                  SizedBox(height: Dimensions.height10 * 3),

                  // Action Button
                  GradientButton(
                    onTap: () => controller.handleLogin(),
                    height: Dimensions.height10 * 5,
                    child: SmallText(
                      text: "Masuk",
                      color: AppColors.whiteColor,
                      size: Dimensions.font16,
                    ),
                  ),
                  SizedBox(height: Dimensions.height8),

                  // Lupa Password
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensions.height10),
                      child: const SmallText(
                        text: "Lupa Password?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10 * 3),

                  // Pemisah Atau
                  Stack(
                    children: [
                      const Divider(
                        thickness: 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.softPurple,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 4),
                              child: SmallText(
                                text: "ATAU",
                                size: Dimensions.font12,
                                color: AppColors.primaryColor,
                                lineHeight: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10 * 3),

                  // Button Sign with Apple
                  ButtonWithLogo(
                    onTap: () {
                      Get.defaultDialog(
                        title: "😅 Coming Soon!",
                        titleStyle: TextStyle(fontSize: Dimensions.font28),
                        middleText:
                            "Fitur Sign In dengan Akun Apple akan segera hadir!",
                        titlePadding:
                            EdgeInsets.only(top: Dimensions.height10 * 2),
                      );
                    },
                    text: "Sign in with Apple",
                    textColor: AppColors.whiteColor,
                    logo: const Icon(
                      Icons.apple,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                    buttonColor: AppColors.blackColor,
                  ),
                  SizedBox(height: Dimensions.height10),

                  // Button Sign with Google
                  ButtonWithLogo(
                    onTap: () => controller.signInWithGoogle(),
                    text: "Sign in with Google",
                    textColor: AppColors.textBlack,
                    logo: Image.asset("assets/logos/logo_google.png"),
                    buttonColor: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Loading Screen
        Obx(
          () => controller.isLoading.isTrue
              ? const LoadingActivity()
              : const SizedBox(),
        ),
      ],
    );
  }
}
