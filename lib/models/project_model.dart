import 'project_images.dart';

class ProjectModel {
  int? id;
  String? title;
  List<ProjectImages>? images;
  String? contractorName;
  String? dimension;
  double? cost;
  double? rating;
  String? category;
  String? location;
  String? city;
  DateTime? startDate;
  DateTime? endDate;

  ProjectModel({
    this.id,
    this.title,
    this.images,
    this.contractorName,
    this.dimension,
    this.cost,
    this.rating,
    this.category,
    this.location,
    this.city,
    this.startDate,
    this.endDate,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    images = json['images']
        .map<ProjectImages>((image) => ProjectImages.fromJson(image))
        .toList();
    contractorName = json['contractor_name'];
    dimension = json['dimension'];
    cost = json['cost'];
    rating = json['rating'];
    category = json['category'];
    location = json['location'];
    city = json['city'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  // factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
  //       id: json['id'],
  //       title: json['title'],
  //       image: List<ImagesProject>.from(
  //           json['image'].map((x) => ImagesProject.fromJson(x))),
  //       contractorName: json['contractor_name'],
  //       dimension: json['dimension'],
  //       cost: json['cost'],
  //       rating: json['rating'],
  //       category: json['category'],
  //       location: json['location'],
  //       city: json['city'],
  //       startDate: json['start_date'],
  //       endDate: json['end_date'],
  //     );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images!.map((image) => image.toJson()).toList(),
      'contractor_name': contractorName,
      'dimension': dimension,
      'cost': cost,
      'rating': rating,
      'category': category,
      'location': location,
      'city': city,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}
