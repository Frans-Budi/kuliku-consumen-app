import 'dart:async';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/gallery_widget.dart';

class SearchResultDetailController extends GetxController {
  RxInt index = 1.obs;
  RxInt show = 0.obs;

  @override
  void onInit() {
    show.value = 1;
    Timer(const Duration(seconds: 3), () {
      show.value -= 1;
    });
    super.onInit();
  }

  void showAndHide(int i) {
    index.value = i + 1;
    show.value += 1;
    Timer(const Duration(seconds: 3), () {
      show.value -= 1;
    });
  }

  void openGallery(List<String> urlImages, int index) {
    Get.to(GalleryWidget(
      projectImages: urlImages,
      index: index,
    ));
  }
}
