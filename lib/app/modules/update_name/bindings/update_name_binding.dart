import 'package:get/get.dart';

import '../controllers/update_name_controller.dart';

class UpdateNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateNameController>(
      () => UpdateNameController(),
    );
  }
}
