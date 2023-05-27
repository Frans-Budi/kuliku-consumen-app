import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/providers/auth_provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class PhoneRegisterController extends GetxController {
  final TextEditingController phoneC = TextEditingController();

  final authProvider = Get.find<AuthProvider>();

  RxBool isLoading = false.obs;

  Future<void> phoneAuthentication() async {
    isLoading.value = true;
    if (phoneC.text.isNotEmpty) {
      // Cek apakah nomor telepon sudah terpakai sebelumnya atau sebelum
      if (!await authProvider.checkPhoneNumber(
          phoneNumber: "+62 ${phoneC.text}")) {
        // Jika nomor telepon belum terpakai -> Register Nomor telepon
        await authProvider.phoneAuthentication("+62 ${phoneC.text}");
      } else {
        // Jika nomor telepon sudah terpakai sebelumnya
        Get.snackbar(
          "Terjadi Kesalahan",
          "Nomor Telepon sudah terpakai sebelumnya!",
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.all(Dimensions.radius25),
          boxShadows: AppColors.basicShadow,
        );
      }
    } else {
      Get.snackbar(
        "Terjadi Kesalahan",
        "Nomor Telepon harus diisi!",
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.all(Dimensions.radius25),
        boxShadows: AppColors.basicShadow,
      );
    }
    isLoading.value = false;
  }
}
