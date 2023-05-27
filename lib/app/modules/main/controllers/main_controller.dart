import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../transaction/views/transaction_view.dart';

class MainController extends GetxController {
  RxInt indexNavbar = 0.obs;

  RxList activities = [
    HomeView(),
    TransactionView(),
    ProfileView(),
  ].obs;
}
