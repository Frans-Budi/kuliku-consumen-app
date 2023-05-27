import 'package:get/get.dart';

import '../controllers/search_needs_controller.dart';

class SearchNeedsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchNeedsController>(
      () => SearchNeedsController(),
    );
  }
}
