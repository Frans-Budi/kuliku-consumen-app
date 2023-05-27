import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController quer = TextEditingController();
  RxInt pencarian = 0.obs;

  RxInt tapCategoryIndex = 100.obs;

  List<String> needs = [
    "Cari Kontraktor",
    "Cari Properti",
  ];

  List<String> categories = [
    "Rumah Baru",
    "Renovasi",
    "Lantai",
    "Atap",
    "Listrik",
    "Pipa",
    "Kamar Mandi",
    "Kolam",
    "Dapur",
    "Ruko",
    "Jalan",
    "Kosan",
  ];
}
