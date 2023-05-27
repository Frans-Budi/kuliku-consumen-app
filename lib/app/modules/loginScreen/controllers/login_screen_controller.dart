import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/app/routes/app_pages.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  final authProvider = Get.find<AuthProvider>();

  RxBool isLoading = false.obs;

  Future<void> handleLogin() async {
    isLoading.value = true;
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      // Login Akun
      if (await authProvider.login(
        email: emailC.text,
        password: passC.text,
      )) {
        // Jika berhasil login
        String id = authProvider.user!.id.toString();
        // Cek apakah nomor telepon sudah ada di akunnya
        if (await authProvider.checkUserPhoneNumber(id: id)) {
          // Jika nomor telepon sudah ada sebelumnya -> pindah ke Activity HOME
          Get.offNamed(Routes.MAIN);
        } else {
          // Jika nomor telepon belum ada sebelumnya -> Register Phone Number
          Get.offNamed(Routes.PHONE_REGISTER);
        }
      } else {
        // Jika ada Exceptions
        Get.snackbar(
          "Terjadi Kesalahan",
          "${authProvider.message}",
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.all(Dimensions.radius25),
          boxShadows: AppColors.basicShadow,
        );
      }
    } else {
      // Tampilkan Snackbar jika user belum input semua textfield
      Get.snackbar(
        "Terjadi Kesalahan",
        "Nama, Email, dan Password harus diisi!",
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.all(Dimensions.radius25),
        boxShadows: AppColors.basicShadow,
      );
    }
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    await authProvider.signInWithGoogle();
    isLoading.value = false;
  }
}
