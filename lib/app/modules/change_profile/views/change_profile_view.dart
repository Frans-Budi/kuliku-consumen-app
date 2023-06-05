import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/app/modules/update_name/controllers/update_name_controller.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/providers/auth_provider.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../../../../Widgets/edit_profile_line.dart';
import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.authProvider.box.read('token'));

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
      body: GestureDetector(
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
          children: [
            SizedBox(height: Dimensions.height10 * 2),
            // Profile Image
            GetBuilder<ChangeProfileController>(
              id: "profileImage",
              builder: (_) {
                if (controller.user!.profileImage == null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/unknown_person.jpeg",
                          fit: BoxFit.cover,
                          width: Dimensions.height10 * 10,
                          height: Dimensions.height10 * 10,
                        ),
                      ),
                      TextButton(
                        onPressed: () => controller.uploadProfileImage(),
                        child: BigText(
                          text: "Ubah Foto Profil",
                          size: Dimensions.font20,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/unknown_person.jpeg",
                        width: Dimensions.height10 * 10,
                        height: Dimensions.height10 * 10,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 300),
                        image: controller.user!.profileImage!,
                        imageErrorBuilder: (c, e, s) {
                          return Image.asset(
                            "assets/images/unknown_person.jpeg",
                            width: Dimensions.height10 * 10,
                            height: Dimensions.height10 * 10,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.uploadProfileImage(),
                      child: BigText(
                        text: "Ubah Foto Profil",
                        size: Dimensions.font20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: Dimensions.height16),
            // INFO PROFILE
            BigText(
              text: "Info Profil",
              size: Dimensions.font20,
            ),
            SizedBox(height: Dimensions.height10 * 2),

            // Name
            GetBuilder<AuthProvider>(
              id: "updateName",
              builder: (_) {
                return EditProfileLine(
                  onTap: () => Get.toNamed(Routes.UPDATE_NAME),
                  title: "Nama",
                  text: _.user!.name!,
                );
              },
            ),
            SizedBox(height: Dimensions.height10 * 3),

            // Email
            EditProfileLine(
              title: "Email",
              text: controller.authProvider.user!.email!,
              icon: null,
            ),
            SizedBox(height: Dimensions.height10 * 3),

            // PhoneNumber
            GetBuilder<AuthProvider>(
              id: "updatePhoneNumber",
              builder: (_) {
                return EditProfileLine(
                  onTap: () => Get.toNamed(Routes.PHONE_REGISTER),
                  title: "Nomor HP",
                  text: _.user!.phoneNumber ?? "",
                );
              },
            ),
            SizedBox(height: Dimensions.height10 * 3),
          ],
        ),
      ),
    );
  }
}
