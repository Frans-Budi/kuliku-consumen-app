import 'package:flutter/material.dart';
import 'package:kuliku/utils/colors.dart';
import 'package:kuliku/utils/dimensions.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryWidget extends StatefulWidget {
  final PageController pageController;
  final List<String> projectImages;
  final int index;

  GalleryWidget({
    super.key,
    required this.projectImages,
    this.index = 0,
  }) : pageController = PageController(initialPage: index);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image Gallery
          PhotoViewGallery.builder(
            pageController: widget.pageController,
            itemCount: widget.projectImages.length,
            builder: (context, index) {
              final projectImage = widget.projectImages[index];

              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(projectImage),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
              );
            },
          ),
          // Close Button
          Padding(
            padding: EdgeInsets.only(top: Dimensions.paddingTop),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: AppColors.whiteColor,
                size: Dimensions.font28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
