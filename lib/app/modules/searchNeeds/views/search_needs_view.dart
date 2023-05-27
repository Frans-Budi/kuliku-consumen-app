import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';

import '../controllers/search_needs_controller.dart';

class SearchNeedsView extends GetView<SearchNeedsController> {
  SearchNeedsView({Key? key}) : super(key: key);

  final String? keyword = Get.arguments;

  @override
  Widget build(BuildContext context) {
    if (keyword == null) {
      controller.keyword.text = "";
    } else {
      controller.keyword.text = keyword!;
      controller.runFilter(keyword!);
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundActivity,
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.paddingTop),
        child: Column(
          children: [
            // Search Bar & Back Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
              child: Row(
                children: [
                  // Tombol Back
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  // Search Bar
                  Expanded(
                    child: Material(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(100),
                      child: TextField(
                        autofocus: true,
                        cursorColor: AppColors.textGray,
                        autocorrect: false,
                        controller: controller.keyword,
                        onTap: () {
                          // Update Suggestion
                          controller.runFilter(controller.keyword.text);
                        },
                        onSubmitted: (value) {
                          // UnFocus keyboard & textfield
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) => controller.runFilter(value),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                          ),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 2),
                          ),
                          hintText: "Mau bagun apa?",
                          prefixIcon: const Icon(Icons.search_rounded),
                          filled: false,
                          fillColor: AppColors.backgroundColor,
                          suffixIcon: Obx(
                            () => controller.isClear.isTrue
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: Dimensions.height10 / 2),
                                    child: IconButton(
                                      onPressed: () {
                                        // Clear keyword
                                        controller.keyword.clear();

                                        // Update Suggestion
                                        controller
                                            .runFilter(controller.keyword.text);
                                      },
                                      icon: const Icon(Icons.clear),
                                      splashRadius: Dimensions.iconSize20,
                                      color: AppColors.textGray,
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height10),
            // Suggestion
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.foundSuggestions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.height10 * 3,
                        ),
                        child: ListTile(
                          onTap: () {
                            // UnFocus keyboard & textfield
                            FocusManager.instance.primaryFocus?.unfocus();

                            // Pindah ke search result
                            Get.offNamed(
                              Routes.SEARCH_RESULT,
                              arguments: controller.foundSuggestions[index],
                            );
                          },
                          title: SmallText(
                            text: controller.foundSuggestions[index],
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
