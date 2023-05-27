import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/models/user_model.dart';

import '../../../../Widgets/basic_list_tile.dart';
import '../../../../Widgets/loading_activity.dart';
import '../../../../controllers/basic_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Dimensions.paddingTop),
          child: Stack(
            children: [
              // Profile Info -> Profile Image, Email, & Name
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
                child: StreamBuilder<UserModel>(
                    stream: controller.userAccount(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(color: Colors.white);
                      }
                      UserModel user = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: user.profileImage == null
                                ? const AssetImage(
                                    "assets/images/unknown_person.jpeg")
                                : NetworkImage(user.profileImage!)
                                    as ImageProvider,
                            backgroundColor: AppColors.grayColor,
                            radius: Dimensions.height10 * 5,
                          ),
                          SizedBox(height: Dimensions.height16),
                          // Name
                          BigText(
                            text: user.name!,
                            size: Dimensions.font24,
                          ),
                          SizedBox(height: Dimensions.height8 / 2),
                          // Email
                          SmallText(
                            text: user.email!,
                            size: Dimensions.font16,
                          ),
                          SizedBox(height: Dimensions.height16 * 2),
                          const Divider(
                            thickness: 0.8,
                          ),
                        ],
                      );
                    }),
              ),
              // ListTile Profile
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height10 * 23),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.height10),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      // Ubah Profile
                      BasicListTile(
                        onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
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
