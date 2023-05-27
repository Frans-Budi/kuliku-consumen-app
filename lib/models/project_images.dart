class ProjectImages {
  String? id;
  String? imageUrl;

  ProjectImages({
    this.id,
    this.imageUrl,
  });

  ProjectImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
    };
  }
}
