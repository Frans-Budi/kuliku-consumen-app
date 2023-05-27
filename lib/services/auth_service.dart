import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:kuliku/models/user_model.dart';
import 'package:kuliku/utils/app_contants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = AppContants.baseUrl;
  final box = GetStorage();

  Future<dynamic> register({
    String? name,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';

      // Simpan Token ke Local Storage
      box.write("token", "${user.token}");

      return user;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';

      // Simpan Token ke Local Storage
      box.write("token", "${user.token}");

      return user;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> loginWithToken(String token) async {
    var url = '$baseUrl/login_with_token';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ${data['toke']}';

      return user;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> logout(String token) async {
    var url = '$baseUrl/logout';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // Hapus Token dari local Storage
      box.remove("token");

      return data;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> updatePhoneNumber({
    String? phoneNumber,
    String? id,
  }) async {
    String token = box.read('token');
    var url = '$baseUrl/update_phone_number/$id';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'phone_number': phoneNumber,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return data;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> updateProfileImageUrl({
    String? profileImage,
    String? id,
  }) async {
    String token = box.read('token');
    var url = '$baseUrl/update_profile_image_url/$id';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'profile_image': profileImage,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> checkPhoneNumber({
    String? phoneNumber,
  }) async {
    var url = '$baseUrl/check_phone_number';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'phone_number': phoneNumber,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      bool success = jsonDecode(response.body)['success'];
      return success;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> checkUserPhoneNumber({
    String? id,
  }) async {
    String token = box.read('token');
    var url = '$baseUrl/check_user_phone_number/$id';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      // Ambil Message Jika response Error
      String message = jsonDecode(response.body)['message'];
      return message;
    }
  }

  Future<dynamic> checkGoogleId({
    String? googleId,
  }) async {
    var url = '$baseUrl/check_google_id';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'google_id': googleId,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      bool success = jsonDecode(response.body)['success'];
      return success;
    } else {
      // Ambil Message Jika response Error
      bool success = jsonDecode(response.body)['success'];
      return success;
    }
  }

  Future<dynamic> updateGoogleId({
    String? googleId,
    String? id,
  }) async {
    var url = '$baseUrl/update_google_id/$id';
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'google_id': googleId,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      if (data == null) {
        String message = "Update Google Id";
        return message;
      } else {
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['token']}';
        return user;
      }
    }
  }
}
