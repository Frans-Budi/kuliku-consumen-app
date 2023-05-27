import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/gradient_button.dart';
import 'package:kuliku/models/user_model.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../../../../Widgets/small_Text.dart';
import '../../../../Widgets/text_input.dart';
import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = controller.authProvider.user!;
    List<String>? phoneNumber = user.phoneNumber?.split(' ');
    controller.nameC.text = user.name!;
    controller.emailC.text = user.email!;
    controller.phoneC.text = phoneNumber?[1] ?? "";

    return Scaffold(
      backgroundColor: AppColors.backgroundActivity,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundActivity,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.height16),
          child: IconButton(
            onPressed: () => Get.back(),
            splashRadius: Dimensions.radius25,
            icon: Icon(
              Icons.close,
              size: Dimensions.iconSize28,
              color: AppColors.blackColor,
            ),
          ),
        ),
        title: BigText(
          text: "Ubah Profil",
          size: Dimensions.font20,
        ),
      ),
      bottomSheet: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.height16,
              right: Dimensions.height16,
              bottom: Dimensions.height10 * 2,
            ),
            child: Obx(
              () => controller.enableButton.isTrue
                  ? GradientButton(
                      onTap: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensions.height12),
                        child: SmallText(
                          text: "Ubah Profil",
                          color: AppColors.whiteColor,
                          size: Dimensions.font18,
                        ),
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
                          text: "Ubah Profil",
                          color: AppColors.darkGrayColor,
                          size: Dimensions.font18,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
          children: [
            SizedBox(height: Dimensions.height10 * 2),
            // Input Name
            SmallText(
              text: "Nama Lengkap",
              size: Dimensions.font16,
              color: AppColors.textBlack,
            ),
            SizedBox(height: Dimensions.height8),
            TextInput(
              controller: controller.nameC,
              onChanged: controller.handleButton(),
              prefixIcon: const Icon(Icons.person),
              hintText: "Masukkan nama Anda di sini",
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
              readOnly: true,
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
              hintText: "Masukkan nomor telepon Anda",
              keyboardType: TextInputType.number,
              prefixText: "+62 ",
              inputFormatter: "number",
            ),
            SizedBox(height: Dimensions.height16),

            // Profile Image
            SmallText(
              text: "Gambar Profil",
              size: Dimensions.font16,
              color: AppColors.textBlack,
            ),
            SizedBox(height: Dimensions.height8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: user.profileImage == null
                      ? const AssetImage("assets/images/unknown_person.jpeg")
                      : NetworkImage(user.profileImage!) as ImageProvider,
                  backgroundColor: AppColors.grayColor,
                  radius: Dimensions.height10 * 5,
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: SmallText(
                      text: "Upload",
                      size: Dimensions.font16,
                      color: AppColors.textBlack,
                    )),
              ],
            ),
            SizedBox(height: Dimensions.height16),
          ],
        ),
      ),
    );
  }
}
