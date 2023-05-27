import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/app/routes/app_pages.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/format_currency.dart';

import '../../../../Widgets/icon_and_text.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  SearchResultView({Key? key}) : super(key: key);

  final String? keyword = Get.arguments;

  @override
  Widget build(BuildContext context) {
    if (keyword == null) {
      controller.keyword.text = "";
    } else {
      controller.keyword.text = keyword!;
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
                        cursorColor: AppColors.textGray,
                        autocorrect: false,
                        controller: controller.keyword,
                        onTap: () {
                          Get.offNamed(Routes.SEARCH_NEEDS, arguments: keyword);
                        },
                        onSubmitted: (value) {
                          // UnFocus keyboard & textfield
                          FocusScope.of(context).unfocus();
                        },
                        // onChanged: (value) => controller.runFilter(value),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List of Item
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.allProjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    margin: EdgeInsets.only(
                      left: Dimensions.height16,
                      right: Dimensions.height16,
                      bottom: Dimensions.height10 * 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.SEARCH_RESULT_DETAIL,
                          arguments: controller.allProjects[index],
                        );
                      },
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      child: Row(
                        children: [
                          // Image
                          // Image.network(
                          //   controller.allProjects[index].images![0].imageUrl!,
                          //   width: 120,
                          //   height: 160,
                          //   fit: BoxFit.cover,
                          // ),

                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(controller
                                    .allProjects[index].images![0].imageUrl!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.radius10),
                                bottomLeft:
                                    Radius.circular(Dimensions.radius10),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.height16),
                          // Description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Dimensions.height16),
                                // Rating
                                Row(
                                  children: [
                                    // star
                                    Icon(
                                      Icons.star_rounded,
                                      color: AppColors.starColor,
                                      size: Dimensions.font20,
                                    ),
                                    SizedBox(width: Dimensions.height12 / 2),
                                    // Point
                                    SmallText(
                                      text:
                                          "${controller.allProjects[index].rating}",
                                      color: AppColors.textBlack,
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.height8),
                                // Title
                                SmallText(
                                  text: controller.allProjects[index].title!,
                                  color: AppColors.textBlack,
                                  size: Dimensions.font18,
                                ),
                                SizedBox(height: Dimensions.height8 / 2),
                                // Sub Title
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: AppColors.textGray,
                                      fontSize: Dimensions.font14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: controller.allProjects[index]
                                              .contractorName),
                                      const TextSpan(text: ", "),
                                      TextSpan(
                                          text: controller
                                              .allProjects[index].city),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Dimensions.height8 / 2),
                                // Lama Pengerjaan
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: AppColors.textGray,
                                      fontSize: Dimensions.font14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(text: "Lama Waktu: "),
                                      TextSpan(
                                        text:
                                            "${controller.allProjects[index].startDate}",
                                      ),
                                    ],
                                  ),
                                ),
                                // Cost
                                BigText(
                                  text: FormatCurrency.convertToIdr(
                                      controller.allProjects[index].cost, 0),
                                  size: Dimensions.font16,
                                ),
                                SizedBox(height: Dimensions.height16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
