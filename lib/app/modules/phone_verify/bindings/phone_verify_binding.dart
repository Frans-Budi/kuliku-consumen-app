import 'package:get/get.dart';
import 'package:kuliku/app/modules/phone_register/controllers/phone_register_controller.dart';

import '../controllers/phone_verify_controller.dart';

class PhoneVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneVerifyController>(
      () => PhoneVerifyController(),
    );
    Get.lazyPut<PhoneRegisterController>(
      () => PhoneRegisterController(),
    );
  }
}
