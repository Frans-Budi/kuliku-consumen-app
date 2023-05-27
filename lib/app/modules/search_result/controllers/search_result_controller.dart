import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliku/models/project_model.dart';

import '../../../../models/project_images.dart';

class SearchResultController extends GetxController {
  final TextEditingController keyword = TextEditingController();

  final List<ProjectImages> _projectImages = [];

  final List<ProjectModel> _allProjects = [
    ProjectModel(
      id: 1,
      title: "Kolam Koi Minimalis",
      images: [
        ProjectImages(
          id: "1",
          imageUrl:
              "https://images.unsplash.com/photo-1587135072732-5bb4849a02c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "2",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1661963462506-79ba42476383?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "3",
          imageUrl:
              "https://images.unsplash.com/photo-1591296720990-0c3a664c0da5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80",
        ),
      ],
      contractorName: "Aririn Design",
      dimension: "2m x 1,5m x 1m",
      category: "Kolam",
      cost: 5000000,
      rating: 4.9,
      location: "Cibiru, Bandung",
      city: "Bandung",
      startDate: DateTime(2022, 5, 1),
      endDate: DateTime.now(),
    ),
    ProjectModel(
      id: 2,
      title: "Modern Koi",
      images: [
        ProjectImages(
          id: "1",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1669822277951-5bb0003e8502?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "2",
          imageUrl:
              "https://images.unsplash.com/photo-1591296720990-0c3a664c0da5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80",
        ),
        ProjectImages(
          id: "3",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1661963462506-79ba42476383?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
      ],
      contractorName: "Bangun Sejahtera",
      dimension: "2m x 1,5m x 1,2m",
      category: "Kolam",
      cost: 10000000,
      rating: 4.7,
      location: "Cibiru, Bandung",
      city: "Bandung",
      startDate: DateTime(2022, 5, 1),
      endDate: DateTime.now(),
    ),
    ProjectModel(
      id: 3,
      title: "Kolam Nuansa Alam",
      images: [
        ProjectImages(
          id: "1",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1661963462506-79ba42476383?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "2",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1669822277951-5bb0003e8502?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "3",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1669822277951-5bb0003e8502?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
      ],
      contractorName: "Dinding Kontraktor",
      dimension: "3m x 1,5m x 1m",
      category: "Kolam",
      cost: 8000000,
      rating: 4.9,
      location: "Cibiru, Bandung",
      city: "Bandung",
      startDate: DateTime(2022, 5, 1),
      endDate: DateTime.now(),
    ),
    ProjectModel(
      id: 4,
      images: [
        ProjectImages(
          id: "1",
          imageUrl:
              "https://images.unsplash.com/photo-1596753055375-7314a20f6106?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "2",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1661963462506-79ba42476383?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        ),
        ProjectImages(
          id: "3",
          imageUrl:
              "https://images.unsplash.com/photo-1591296720990-0c3a664c0da5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80",
        ),
      ],
      title: "Japan Koi",
      contractorName: "Bangun Sejahtera",
      dimension: "3m x 2m x 1m",
      category: "Kolam",
      cost: 6000000,
      rating: 4.5,
      location: "Cibiru, Bandung",
      city: "Bandung",
      startDate: DateTime(2022, 5, 1),
      endDate: DateTime.now(),
    ),
  ];

  List<ProjectModel> get allProjects => _allProjects;

  void runFilter(String keyword) {
    List<ProjectModel> results = [];
    if (keyword.isBlank!) {
      // if the search field is empty or only contains white-space, we'll disapear
      results = _allProjects;
    } else {
      results = _allProjects
          .where(
            (result) => result.category!
                .toLowerCase()
                .contains(keyword.toString().toLowerCase()),
          )
          .toList();
    }

    // Reset all Suggestions
    // foundSuggestions([]);
    // foundSuggestions.addAll(results);
  }
}
