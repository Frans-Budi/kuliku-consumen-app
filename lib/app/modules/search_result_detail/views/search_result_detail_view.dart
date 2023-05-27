import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/big_text.dart';
import 'package:kuliku/Widgets/gradient_button.dart';
import 'package:kuliku/Widgets/icon_and_text.dart';
import 'package:kuliku/Widgets/testimoni_widget.dart';
import 'package:kuliku/models/project_model.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';
import 'package:kuliku/utils/format_currency.dart';

import '../../../../Widgets/short_portofolio.dart';
import '../../../../Widgets/small_Text.dart';
import '../controllers/search_result_detail_controller.dart';

class SearchResultDetailView extends GetView<SearchResultDetailController> {
  SearchResultDetailView({Key? key}) : super(key: key);
  final ProjectModel project = Get.arguments;

  @override
  Widget build(BuildContext context) {
    List<String> projectImages =
        project.images!.map((e) => e.imageUrl!).toList();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Gallery
                Stack(
                  children: [
                    // Caurosell
                    Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: project.images!.length,
                          options: CarouselOptions(
                            height: 270,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) =>
                                controller.showAndHide(index),
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final image = project.images![index].imageUrl;
                            return GestureDetector(
                              onTap: () =>
                                  controller.openGallery(projectImages, index),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    // Indicator
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Obx(
                        () => AnimatedOpacity(
                          opacity: controller.show.value == 0 ? 0 : 1,
                          duration: const Duration(milliseconds: 400),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height12,
                              vertical: Dimensions.height8 / 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Obx(
                              () => RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: AppColors.textBlack,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: "${controller.index.value}"),
                                    const TextSpan(text: "/"),
                                    TextSpan(text: "${project.images!.length}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Back
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.paddingTop,
                          left: Dimensions.height10),
                      child: Material(
                        type: MaterialType.button,
                        color: AppColors.whiteColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(100),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          splashRadius: 25,
                          icon: Padding(
                            padding: EdgeInsets.only(left: Dimensions.height8),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Content
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.height16,
                    right: Dimensions.height16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height16),
                      // Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height10 * 4,
                              vertical: Dimensions.height8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.grayColor,
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: BigText(
                              text:
                                  FormatCurrency.convertToIdr(project.cost!, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),
                      // Title
                      BigText(
                        text: "${project.title}",
                        size: Dimensions.font24,
                      ),
                      // Ukuran
                      BigText(
                        text: "${project.dimension}",
                        size: Dimensions.font24,
                      ),
                      SizedBox(height: Dimensions.height16),
                      // Rating & Duration
                      Row(
                        children: [
                          // Rating
                          SizedBox(
                            width: (Dimensions.screenWidth / 2),
                            child: Row(
                              children: [
                                // star
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.starColor,
                                  size: Dimensions.font28,
                                ),
                                SizedBox(width: Dimensions.height12 / 2),
                                // Point
                                SmallText(
                                  text: "${project.rating}",
                                  color: AppColors.textGray,
                                  size: Dimensions.font16,
                                ),
                              ],
                            ),
                          ),
                          // Duration
                          const IconAndText(
                            text: "1 Minggu",
                            icon: Icons.access_time_filled,
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height12),
                      // Location & Since
                      Row(
                        children: [
                          // Location
                          SizedBox(
                            width: (Dimensions.screenWidth / 2),
                            child: IconAndText(
                              text: "${project.location}",
                              icon: Icons.location_on_rounded,
                            ),
                          ),
                          // Since
                          const IconAndText(
                            text: "Sejak 2018",
                            icon: Icons.hourglass_bottom,
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10 * 3),
                      const Divider(thickness: 1),
                      SizedBox(height: Dimensions.height10 * 3),
                      // User & Button
                      Row(
                        children: [
                          // User
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.radius10 * 3,
                                  backgroundColor: AppColors.grayColor,
                                  backgroundImage: const AssetImage(
                                      "assets/images/unknown_person.jpeg"),
                                ),
                                SizedBox(width: Dimensions.height10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: project.contractorName!,
                                      color: AppColors.textBlack,
                                      size: Dimensions.font16,
                                    ),
                                    SizedBox(height: Dimensions.height8 / 2),
                                    const SmallText(text: "Kontraktor"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Button Kirim Pesan
                          Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.height12),
                                child: const Icon(Icons.chat_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10 * 3),
                      // Pernah Membuat
                      const BigText(
                        text: "Pernah Membuat",
                      ),
                      // Portofolio Singkat
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 5 / 2,
                        children: [
                          ShortPortofolio(
                            category: "Kolam Ikan",
                            quantity: 7,
                            icon: SvgPicture.asset(
                              "assets/icons/ion_fish-sharp.svg",
                            ),
                          ),
                          ShortPortofolio(
                            category: "Kosan",
                            quantity: 13,
                            icon: SvgPicture.asset(
                              "assets/icons/hospital.svg",
                            ),
                          ),
                          ShortPortofolio(
                            category: "Kitchen Set",
                            quantity: 20,
                            icon: SvgPicture.asset(
                              "assets/icons/kitchen.svg",
                            ),
                          ),
                          ShortPortofolio(
                            category: "Interior",
                            quantity: 20,
                            icon: SvgPicture.asset(
                              "assets/icons/interior.svg",
                            ),
                          ),
                        ],
                      ),
                      // Testimoni
                      const BigText(text: "Testimoni"),
                      SizedBox(height: Dimensions.height10 * 2),
                      // TODO: seharusnya di Generate
                      const TestimoniWidget(
                        name: "Sinta",
                        star: 5,
                        imageUrl:
                            "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
                        description:
                            "Saya sangat puas dengan hasil kerja kontraktor yang membuat kolam koi di halaman belakang rumah saya. Kontraktor tersebut sangat profesional dan terampil dalam merancang dan membangun kolam koi yang sesuai dengan keinginan saya.  kolam koi di halaman belakang rumah saya. Kontraktor tersebut sangat profesional dan terampil hasil kerja kontraktor yang membuat kolam koi di halaman belakang rumah saya",
                      ),
                      SizedBox(height: Dimensions.height10 * 3),
                      const TestimoniWidget(
                        name: "Asep Saepudin",
                        star: 4,
                        imageUrl:
                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
                        description:
                            "Saya sangat puas dengan hasil kerja kontraktor yang membuat kolam koi di halaman belakang rumah saya. Kontraktor tersebut sangat profesional dan terampil dalam merancang dan membangun kolam koi yang sesuai dengan keinginan saya.  kolam koi di halaman belakang rumah saya. Kontraktor tersebut sangat profesional dan terampil hasil kerja kontraktor yang membuat kolam koi di halaman belakang rumah saya",
                      ),
                      SizedBox(height: Dimensions.height16),
                      // Tentang
                      const BigText(text: "Tentang"),
                      SizedBox(height: Dimensions.height10),
                      const Text(
                        "Sebagai kontraktor, kami di Arsirin Design selalu berkomitmen untuk memberikan layanan yang terbaik bagi para klien kami. Kami memiliki tim profesional yang berpengalaman dan ahli dalam bidang desain dan konstruksi bangunan, termasuk dalam pembuatan kolam koi, kitchen set, dan interior.",
                        style: TextStyle(
                          color: AppColors.textGray,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: Dimensions.height10 * 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Action Button
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: GradientButton(
              onTap: () {},
              height: Dimensions.height10 * 5,
              child: SmallText(
                text: "Saya Tertarik",
                color: AppColors.whiteColor,
                size: Dimensions.font16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
