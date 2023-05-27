import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/gradient_button.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../../../../Widgets/search_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.paddingTop),
      child: Stack(
        children: [
          // Lokasi (Header)
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SmallText(text: "Temukan tempat Anda"),
                SizedBox(height: Dimensions.height10),
                Row(
                  children: [
                    // Icon Location
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) =>
                          AppColors.primaryGradient.createShader(bounds),
                      child: Icon(
                        Icons.location_on_rounded,
                        size: Dimensions.iconSize20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          // TODO: dyamic Locations
                          const BigText(text: "Bandung Indonesia", size: 20),
                          Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.height8 / 2,
                              top: Dimensions.height8 / 2,
                            ),
                            child:
                                SvgPicture.asset("assets/icons/arrow-down.svg"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Body (Scroll Able)
          Container(
            margin: const EdgeInsets.only(top: 70),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const BigText(text: "Apa yang kamu butuhkan?"),
                SizedBox(height: Dimensions.height10 * 2),
                // Button Kebutuhan
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height8,
                    vertical: Dimensions.height8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: AppColors.borderColor, width: 0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Cari Kontraktor
                      Obx(
                        () => GradientButton(
                          onTap: () {
                            controller.pencarian.value = 0;
                          },
                          width: (Dimensions.screenWidth / 2) -
                              (Dimensions.height16 * 2),
                          height: Dimensions.height10 * 4,
                          gradient: controller.pencarian.value == 0
                              ? AppColors.primaryGradient
                              : AppColors.transparentGradient,
                          child: SmallText(
                            text: "Cari Kontraktor",
                            color: controller.pencarian.value == 0
                                ? AppColors.whiteColor
                                : AppColors.textGray,
                          ),
                        ),
                      ),
                      // Cari Properti
                      Obx(
                        () => GradientButton(
                          onTap: () {
                            controller.pencarian.value = 1;
                          },
                          gradient: controller.pencarian.value == 1
                              ? AppColors.primaryGradient
                              : AppColors.transparentGradient,
                          width: (Dimensions.screenWidth / 2) -
                              (Dimensions.height16 * 2),
                          height: Dimensions.height10 * 4,
                          child: SmallText(
                            text: "Cari Properti",
                            color: controller.pencarian.value == 1
                                ? AppColors.whiteColor
                                : AppColors.textGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height10 * 2),
                const BigText(text: "Cari disini"),
                SizedBox(height: Dimensions.height10 * 2),
                // Search Bar
                SearchBar(
                  hintText: "Mau bagun apa?",
                  onTapSearchBar: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(Routes.SEARCH_NEEDS);
                  },
                ),
                SizedBox(height: Dimensions.height10 * 2),
                // Grid Kategori
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height10,
                      vertical: Dimensions.height10 * 2),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor.withOpacity(0.15),
                        blurRadius: 96,
                        offset: const Offset(0, 24),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BigText(text: "Mau Bangun Apa?"),
                          InkWell(
                            onTap: () {},
                            child: const SmallText(
                              text: "Lihat Semua",
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10 * 2),
                      // List Kategori
                      MediaQuery.removePadding(
                        removeTop: true,
                        removeBottom: true,
                        context: context,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 3 / 1.2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GradientButton(
                                onTap: () {
                                  controller.tapCategoryIndex.value = index;
                                  Get.toNamed(Routes.SEARCH_RESULT,
                                      arguments: controller.categories[index]);
                                },
                                gradient:
                                    controller.tapCategoryIndex.value == index
                                        ? AppColors.primaryGradient
                                        : AppColors.backgroundGradient,
                                border:
                                    controller.tapCategoryIndex.value == index
                                        ? const Border()
                                        : Border.all(
                                            color: AppColors.borderColor,
                                            width: 0.8),
                                child: SmallText(
                                  text: controller.categories[index],
                                  fontWeight:
                                      controller.tapCategoryIndex.value == index
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                  color:
                                      controller.tapCategoryIndex.value == index
                                          ? AppColors.whiteColor
                                          : AppColors.textGray,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
