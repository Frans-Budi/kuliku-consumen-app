import 'package:get/get.dart';

import '../controllers/phone_register_controller.dart';

class PhoneRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneRegisterController>(
      () => PhoneRegisterController(),
    );
  }
}
