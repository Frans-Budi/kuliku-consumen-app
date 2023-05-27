import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Widgets/big_text.dart';
import '../../../../Widgets/gradient_button.dart';
import '../../../../Widgets/loading_activity.dart';
import '../../../../Widgets/small_Text.dart';
import '../../../../Widgets/text_input.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/phone_register_controller.dart';

class PhoneRegisterView extends GetView<PhoneRegisterController> {
  PhoneRegisterView({Key? key}) : super(key: key);

  // final controller = Get.put(PhoneRegisterController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // appBar: AppBar(
          //   backgroundColor: AppColors.backgroundActivity,
          //   elevation: 0,
          //   leading: IconButton(
          //     onPressed: () => Get.back(),
          //     splashRadius: Dimensions.radius25,
          //     icon: const Icon(
          //       Icons.arrow_back_ios_new_rounded,
          //       color: AppColors.blackColor,
          //     ),
          //   ),
          // ),
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.height16,
                right: Dimensions.height16,
                top: Dimensions.paddingTop,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  BigText(
                    text: "Registrasi Nomor Telepon",
                    size: Dimensions.font24,
                  ),
                  SizedBox(height: Dimensions.height8),
                  // Keterangan
                  const SmallText(
                    text:
                        "Kami membutuhkan nomor telepon mu untuk berkomunikasi",
                    maxLine: 4,
                    lineHeight: 1.5,
                  ),
                  SizedBox(height: Dimensions.height16),

                  // Input Phone
                  SmallText(
                    text: "Nomor Telepon",
                    size: Dimensions.font16,
                    color: AppColors.textBlack,
                  ),
                  SizedBox(height: Dimensions.height8),
                  TextInput(
                    controller: controller.phoneC,
                    prefixIcon: const Icon(Icons.phone),
                    autoFocus: true,
                    hintText: "Masukkan nomor telepon Anda",
                    keyboardType: TextInputType.number,
                    prefixText: "+62 ",
                    inputFormatter: "number",
                  ),
                  SizedBox(height: Dimensions.height8),
                  // Penjelasan SMS Verifikasi
                  SmallText(
                    text:
                        "Kami akan mengirimkan nomor verifikasi melalui SMS di nomor telepon yang Anda masukkan",
                    maxLine: 2,
                    size: Dimensions.font12,
                  ),

                  // Action Button
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Button
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: Dimensions.height10 * 2),
                          child: GradientButton(
                            onTap: () {
                              controller.phoneAuthentication();
                            },
                            height: Dimensions.height10 * 5,
                            child: Obx(
                              () => controller.isLoading.isFalse
                                  ? SmallText(
                                      text: "Kirim SMS Verifikasi",
                                      color: AppColors.whiteColor,
                                      size: Dimensions.font16,
                                    )
                                  : const CircularProgressIndicator(
                                      color: AppColors.whiteColor,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height10 * 3),
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
