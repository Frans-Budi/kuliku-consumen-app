import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundActivity,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
        decoration: BoxDecoration(
          boxShadow: AppColors.basicShadow,
          color: AppColors.whiteColor,
        ),
        child: Obx(
          () => BottomNavigationBar(
            onTap: (index) {
              controller.indexNavbar.value = index;
            },
            elevation: 0,
            currentIndex: controller.indexNavbar.value,
            unselectedFontSize: 14,
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.primaryColor,
            iconSize: 26,
            selectedLabelStyle: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: "Transaksi",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: "Profil",
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => controller.activities[controller.indexNavbar.value],
      ),
    );
  }
}
