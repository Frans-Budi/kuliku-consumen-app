import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/app/modules/phone_register/controllers/phone_register_controller.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/providers/auth_provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class PhoneVerifyController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final phoneRegisterController = Get.find<PhoneRegisterController>();

  RxBool isLoading = false.obs;

  String? digit1;
  String? digit2;
  String? digit3;
  String? digit4;
  String? digit5;
  String? digit6;

  String? otp() {
    return "$digit1$digit2$digit3$digit4$digit5$digit6";
  }

  void verifyOTP(String otp) async {
    isLoading.value = true;
    if (await authProvider.verifyOTP(otp)) {
      // Deklarasi
      final String phoneNumber = phoneRegisterController.phoneC.text;
      final String idUser = authProvider.user!.id.toString();

      // update phone number
      await authProvider.updatePhoneNumber(
        phoneNumber: "+62 $phoneNumber",
        id: idUser,
      );
      Get.offNamed(Routes.MAIN);
    } else {
      Get.snackbar(
        "Terjadi Kesalahan",
        "Kode OTP yang Anda masukkan Salah!",
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.all(Dimensions.radius25),
        boxShadows: AppColors.basicShadow,
      );
    }
    isLoading.value = false;
  }
}
