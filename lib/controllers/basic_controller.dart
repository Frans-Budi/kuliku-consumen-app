import 'package:get/get.dart';
import 'package:kuliku/app/modules/home/views/home_view.dart';
import 'package:kuliku/app/modules/profile/views/profile_view.dart';
import 'package:kuliku/app/modules/transaction/views/transaction_view.dart';

class BasicController extends GetxController {
  RxInt indexNavbar = 0.obs;

  void navBar(index) {
    switch (index) {
      case 0:
        HomeView();
        break;
      case 1:
        TransactionView();
        break;
      case 2:
        ProfileView();
        break;
      default:
        HomeView();
    }
  }
}
