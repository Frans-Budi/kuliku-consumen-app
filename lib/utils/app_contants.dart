class AppContants {
  // Main Url
  static const String mainUrl = "http://192.168.1.101:90";

  // For IOS Localhost
  // static const String baseUrl = "http://127.0.0.1:8000/api";
  // For Android Localhost
  // static const String baseUrl = "http://10.0.2.2:8000/api";
  // Real Device and All
  static const String baseUrl = "$mainUrl/api";

  // Profile Image URL
  static const String profileImageUrl = "$mainUrl/storage/profile-images/";
  static const String uploadProfileImage = "$baseUrl/upload_profile_image";
}
