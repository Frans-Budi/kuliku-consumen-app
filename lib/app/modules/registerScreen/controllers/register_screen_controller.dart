import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/providers/auth_provider.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

class RegisterScreenController extends GetxController {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  RxBool isLoading = false.obs;

  final authProvider = Get.find<AuthProvider>();

  Future<void> handleRegister() async {
    isLoading.value = true;
    // Semua Inputan harus diisi
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      // Register Akun
      if (await authProvider.register(
        name: nameC.text,
        email: emailC.text,
        password: passC.text,
      )) {
        // Kalau Berhasil tanpa Exception
        Get.offNamed(Routes.PHONE_REGISTER);
      } else {
        // Kalau ada Exceptions
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
