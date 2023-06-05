import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/providers/auth_provider.dart';

import '../../../../models/user_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class UpdateNameController extends GetxController {
  final TextEditingController nameC = TextEditingController();

  final authProvider = Get.find<AuthProvider>();

  RxBool isLoading = false.obs;
  RxBool enableButton = false.obs;

  UserModel? _user;
  UserModel? get user => _user;

  Future<void> updateName() async {
    // Jika Nama yang diupdate
    if (nameC.text.isNotEmpty && nameC.text != _user!.name) {
      // Jika update name Berhasil
      if (await authProvider.updateName(name: nameC.text, id: _user!.id)) {
        _user = authProvider.user;
        update(["updateName"]);

        Get.back();
      } else {
        Get.snackbar(
          "Terjadi Kesalahan",
          authProvider.message!,
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.all(Dimensions.radius25),
          boxShadows: AppColors.basicShadow,
        );
      }
    }
  }

  @override
  void onInit() {
    _user = authProvider.user!;

    nameC.addListener(() {
      // Nama harus diubah dan tidak boleh kosong
      if (nameC.text.isNotEmpty &&
          nameC.text != _user!.name &&
          nameC.text.length >= 3) {
        enableButton.value = true;
      } else {
        enableButton.value = false;
      }
    });

    super.onInit();
  }
}
