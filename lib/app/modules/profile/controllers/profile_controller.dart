import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/providers/auth_provider.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../../../../models/user_model.dart';

class ProfileController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final box = GetStorage();

  RxBool isLoading = false.obs;

  Stream<UserModel> userAccount() async* {
    if (authProvider.user != null) {
      yield authProvider.user!;
    }
  }

  Future<void> logout() async {
    // Muncul Pop up konfirmasi
    Get.defaultDialog(
      title: "Konfirmasi Keluar Akun",
      middleText: "Apakah Anda yakin ingin keluar dari akun Anda?",
      titlePadding: EdgeInsets.only(top: Dimensions.height10 * 2),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
        vertical: Dimensions.height12,
      ),
      actions: [
        // Tidak
        OutlinedButton(
          onPressed: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10 * 2,
              vertical: Dimensions.height10,
            ),
            child: SmallText(
              text: "Tidak",
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              size: Dimensions.font16,
            ),
          ),
        ),
        SizedBox(width: Dimensions.height8 / 2),
        // Ya
        ElevatedButton(
          onPressed: () async {
            isLoading.value = true;
            String token = box.read('token');
            if (await authProvider.logout(token)) {
              Get.offAllNamed(Routes.ON_BOARDING);
            }
            isLoading.value = false;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height16 * 2,
              vertical: Dimensions.height10,
            ),
            child: SmallText(
              text: "Ya",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              size: Dimensions.font16,
            ),
          ),
        ),
      ],
    );
  }
}
