class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? profileImage;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.profileImage,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    profileImage = json['profile_image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'token': token,
    };
  }
}
