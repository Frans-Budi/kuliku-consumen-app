import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Widgets/big_text.dart';
import '../../../../Widgets/gradient_button.dart';
import '../../../../Widgets/loading_activity.dart';
import '../../../../Widgets/small_Text.dart';
import '../../../../Widgets/text_inputan.dart';
import '../../../../models/user_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/update_name_controller.dart';

class UpdateNameView extends GetView<UpdateNameController> {
  const UpdateNameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserModel user = controller.authProvider.user!;
    controller.nameC.text = user.name!;
    return Stack(
      children: [
        Scaffold(
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
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.height16,
                right: Dimensions.height16,
                // top: Dimensions.paddingTop,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  BigText(
                    text: "Ubah Nama",
                    size: Dimensions.font24,
                  ),
                  SizedBox(height: Dimensions.height8),
                  // Keterangan
                  const SmallText(
                    text:
                        "Pakai nama asli untuk memudahkan verfikasi.\nNama ini akan tampil di beberapa halaman.",
                    maxLine: 4,
                    lineHeight: 1.5,
                  ),
                  SizedBox(height: Dimensions.height16),

                  // Input Phone
                  SmallText(
                    text: "Nama",
                    size: Dimensions.font16,
                    color: AppColors.textBlack,
                  ),
                  SizedBox(height: Dimensions.height8),
                  TextInputan(
                    controller: controller.nameC,
                    prefixIcon: const Icon(Icons.person),
                    autoFocus: true,
                    hintText: "Masukkan nama Anda",
                  ),
                  SizedBox(height: Dimensions.height10 * 6),

                  // Action Button
                  Obx(
                    () => controller.enableButton.isTrue
                        ? GradientButton(
                            onTap: () => controller.updateName(),
                            height: Dimensions.height10 * 5,
                            child: SmallText(
                              text: "Simpan",
                              color: AppColors.whiteColor,
                              size: Dimensions.font18,
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            height: Dimensions.height10 * 5,
                            decoration: BoxDecoration(
                              color: AppColors.grayColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: SmallText(
                                text: "Simpan",
                                color: AppColors.darkGrayColor,
                                size: Dimensions.font18,
                              ),
                            ),
                          ),
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
