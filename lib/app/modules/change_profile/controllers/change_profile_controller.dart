import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user_model.dart';
import '../../../../providers/auth_provider.dart';

class ChangeProfileController extends GetxController {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();

  final authProvider = Get.find<AuthProvider>();

  RxBool enableButton = false.obs;

  Function? handleButton() {
    final UserModel user = authProvider.user!;
    List<String>? phoneNumber = user.phoneNumber?.split(' ');
    // Semua Inputan harus terisi
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        phoneC.text.isNotEmpty) {
      // Nama harus diubah
      if (nameC.text != user.name || phoneC.text != phoneNumber?[1]) {
        enableButton.value = true;
      }
    }
  }
}
