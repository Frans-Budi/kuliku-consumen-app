import 'package:get/get.dart';

class Dimensions {
  // (428 x 926) -> 14 Pro Max
  // (390 x 844) -> 14 Pro

  // Safe Area
  static double paddingTop = (Get.context!.mediaQueryPadding.top + height16);

  // Width & Height Divice
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Dynamic Height
  static double height8 = dynamicHeight(8);
  static double height10 = dynamicHeight(10);
  static double height12 = dynamicHeight(12);
  static double height16 = dynamicHeight(16);

  // Fonts
  static double font12 = dynamicHeight(12);
  static double font14 = dynamicHeight(14);
  static double font16 = dynamicHeight(16);
  static double font18 = dynamicHeight(18);
  static double font20 = dynamicHeight(20);
  static double font24 = dynamicHeight(24);
  static double font26 = dynamicHeight(26);
  static double font28 = dynamicHeight(28);

  // Icons
  static double iconSize16 = dynamicHeight(16);
  static double iconSize20 = dynamicHeight(20);
  static double iconSize28 = dynamicHeight(28);

  // Radius
  static double radius10 = dynamicHeight(10);
  static double radius25 = dynamicHeight(25);
}

double dynamicHeight(int size) {
  return Dimensions.screenHeight / 844 * size;
}
