import 'package:get/get.dart';

import '../controllers/search_result_detail_controller.dart';

class SearchResultDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultDetailController>(
      () => SearchResultDetailController(),
    );
  }
}
