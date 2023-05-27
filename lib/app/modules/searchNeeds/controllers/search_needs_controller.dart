import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchNeedsController extends GetxController {
  final TextEditingController keyword = TextEditingController();

  RxBool isClear = false.obs;

  // List All Suggesions
  final List<String> _searchResults = [
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

  List<String> get searchResults => _searchResults;

  RxList<String> foundSuggestions = <String>[].obs;

  void runFilter(String keyword) {
    List<String> results = [];
    if (keyword.isBlank!) {
      // if the search field is empty or only contains white-space, we'll disapear
      results = _searchResults.sublist(0, 5);

      // tombol Clear hilang
      isClear.value = false;
    } else {
      //tombol clear muncul
      isClear.value = true;

      results = _searchResults
          .where(
            (result) =>
                result.toLowerCase().contains(keyword.toString().toLowerCase()),
          )
          .toList();
    }

    // Reset all Suggestions
    foundSuggestions([]);
    foundSuggestions.addAll(results);
  }

  @override
  void onInit() {
    foundSuggestions.addAll(_searchResults.sublist(0, 5));
    super.onInit();
  }
}
