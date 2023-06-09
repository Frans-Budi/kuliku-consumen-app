import 'package:get/get.dart';
import 'package:kuliku/providers/auth_provider.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterScreenController>(
      () => RegisterScreenController(),
    );
  }
}
