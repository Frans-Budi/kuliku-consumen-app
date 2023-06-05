import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kuliku/utils/app_contants.dart';

import '../../../../models/user_model.dart';
import '../../../../providers/auth_provider.dart';

class ChangeProfileController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final ImagePicker _picker = ImagePicker();
  final box = GetStorage();

  XFile? _pickImage;
  File? _file;

  UserModel? _user;
  UserModel? get user => _user;

  RxBool enableButton = false.obs;

  Future<void> uploadProfileImage() async {
    // Deklarasi
    String id = authProvider.user!.id!.toString();

    // Select Image -> Jika tidak null / ada data
    if (await selectImage()) {
      _file = File(_pickImage!.path);
    } else {
      return;
    }

    http.StreamedResponse response = await updateProfile(_pickImage, id);

    print(response.statusCode);

    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      // String message = map["message"];
      // print(message);
      print("=========");
      print(map);

      // Set UserModel
      _user = UserModel.fromJson(map['data']);

      // Modify the image URL
      if (!_user!.profileImage!.contains("https://")) {
        _user!.profileImage =
            AppContants.profileImageUrl + _user!.profileImage!;
      }

      authProvider.user = _user;

      // print(user!.profileImage);

      update(['profileImage']);

      // _imagePath = map['data'];
    } else {
      print("Error uploading image");
    }
  }

  Future<http.StreamedResponse> updateProfile(XFile? data, String $id) async {
    String token = box.read('token');

    print(token);

    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse(AppContants.uploadProfileImage));

    request.headers.addAll(<String, String>{'Authorization': token});

    if (GetPlatform.isMobile && data != null) {
      _file = File(data.path);

      print(_file);

      request.files.add(
        http.MultipartFile(
          'image',
          _file!.readAsBytes().asStream(),
          _file!.lengthSync(),
          filename: _file!.path.split('/').last,
        ),
      );

      request.fields.addAll({"id": $id});
    }

    http.StreamedResponse response = await request.send();
    update(['profileImage']);
    return response;
  }

  Future<bool> selectImage() async {
    try {
      // Pick an image.
      final XFile? imagePicker =
          await _picker.pickImage(source: ImageSource.gallery);

      if (imagePicker != null) {
        _pickImage = imagePicker;
        update();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void onInit() {
    _user = authProvider.user;

    super.onInit();
  }
}
