import 'package:flutter/material.dart';
import 'package:kuliku/Widgets/small_Text.dart';
import 'package:kuliku/Widgets/start_display.dart';
import 'package:readmore/readmore.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class TestimoniWidget extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final int? star;
  final String? description;
  const TestimoniWidget({
    super.key,
    this.imageUrl,
    required this.name,
    this.star = 5,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Head
        Row(
          children: [
            // Image Profile
            imageUrl == null
                ? CircleAvatar(
                    radius: Dimensions.radius10 * 3,
                    backgroundColor: AppColors.grayColor,
                    backgroundImage:
                        const AssetImage("assets/images/unknown_person.jpeg"),
                  )
                : CircleAvatar(
                    radius: Dimensions.radius10 * 3,
                    backgroundColor: AppColors.grayColor,
                    backgroundImage: NetworkImage(imageUrl!),
                  ),
            SizedBox(width: Dimensions.height10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: name,
                  color: AppColors.textBlack,
                  size: Dimensions.font16,
                ),
                SizedBox(height: Dimensions.height8 / 2),
                StarDisplay(value: star!),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.height8 * 2),
        // Content
        ReadMoreText(
          description!,
          trimLines: 5,
          colorClickableText: Colors.pink,
          style: const TextStyle(
            color: AppColors.textGray,
            height: 1.5,
          ),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Lihat Semua',
          trimExpandedText: ' Sebunyikan',
          moreStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          lessStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
