import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/modules/change_profile/controllers/change_profile_controller.dart';
import 'package:kuliku/app/modules/update_name/controllers/update_name_controller.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/providers/auth_provider.dart';

import '../../../../Widgets/basic_list_tile.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());
  final changeProfileC = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.paddingTop),
      child: Stack(
        children: [
          // Profile Info -> Profile Image, Email, & Name
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<ChangeProfileController>(
                  id: "profileImage",
                  builder: (_) {
                    if (changeProfileC.user!.profileImage == null) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/unknown_person.jpeg",
                          fit: BoxFit.cover,
                          width: Dimensions.height10 * 10,
                          height: Dimensions.height10 * 10,
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/unknown_person.jpeg",
                        width: Dimensions.height10 * 10,
                        height: Dimensions.height10 * 10,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 300),
                        image: changeProfileC.user!.profileImage!,
                        imageErrorBuilder: (c, e, s) {
                          return Image.asset(
                            "assets/images/unknown_person.jpeg",
                            width: Dimensions.height10 * 10,
                            height: Dimensions.height10 * 10,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: Dimensions.height16),
                // Name
                GetBuilder<AuthProvider>(
                  id: "updateName",
                  builder: (_) {
                    return BigText(
                      text: _.user!.name!,
                      size: Dimensions.font24,
                    );
                  },
                ),
                SizedBox(height: Dimensions.height8 / 2),
                // Email
                SmallText(
                  text: controller.user!.email!,
                  size: Dimensions.font16,
                ),
                SizedBox(height: Dimensions.height16 * 2),
                const Divider(
                  thickness: 0.8,
                ),
              ],
            ),
          ),
          // ListTile Profile
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height10 * 23),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: false,
                children: [
                  // Ubah Profile
                  BasicListTile(
                    onTap: () {
                      Get.toNamed(Routes.CHANGE_PROFILE);
                    },
                    text: "Ubah Profil",
                    leadingIcon: Icons.person_2,
                  ),
                  // Proyek selesai
                  BasicListTile(
                    onTap: () {},
                    text: "Proyek Selesai Kamu",
                    leadingIcon: Icons.home_work,
                  ),
                  // Kebijakan Privasi
                  BasicListTile(
                    onTap: () {},
                    text: "Kebijakan Privasi",
                    leadingIcon: Icons.privacy_tip,
                  ),
                  // Syarat dan ketentuan
                  BasicListTile(
                    onTap: () {},
                    text: "Syarat dan Ketentuan",
                    leadingIcon: Icons.credit_card,
                  ),
                  // Hubungi Customer Service
                  BasicListTile(
                    onTap: () {},
                    text: "Hubungi Customer Service",
                    leadingIcon: Icons.question_answer,
                  ),
                  // Rating KuliKu
                  BasicListTile(
                    onTap: () {},
                    text: "Rating KuliKu",
                    leadingIcon: Icons.rate_review,
                  ),
                  // Logout
                  BasicListTile(
                    onTap: () => controller.logout(),
                    text: "Keluar",
                    leadingIcon: Icons.logout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
