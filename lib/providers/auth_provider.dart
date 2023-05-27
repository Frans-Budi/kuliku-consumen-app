import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuliku/models/user_model.dart';
import 'package:kuliku/services/auth_service.dart';

import '../app/routes/app_pages.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AuthProvider extends GetxController {
  UserModel? _user;
  UserModel? get user => _user;

  final box = GetStorage();

  String? _message;
  String? get message => _message;

  final _auth = FirebaseAuth.instance;
  RxString verificationId = ''.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<bool> register({
    String? name,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
      );

      _user = user;

      return true;
    } catch (e) {
      String message = await AuthService().register(
        name: name,
        email: email,
        password: password,
      );

      _message = message;

      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;

      return true;
    } catch (e) {
      String message = await AuthService().login(
        email: email,
        password: password,
      );

      _message = message;

      return false;
    }
  }

  Future<bool> loginWithToken(String token) async {
    try {
      UserModel user = await AuthService().loginWithToken(token);

      _user = user;

      return true;
    } catch (e) {
      _message = await AuthService().loginWithToken(token);

      return false;
    }
  }

  Future<bool> logout(String token) async {
    try {
      await AuthService().logout(token);

      return true;
    } catch (e) {
      _message = await AuthService().logout(token);

      return false;
    }
  }

  Future<bool> phoneAuthentication(String phoneNumber) async {
    try {
      // Cek apakah nomor telepon yang dimasukkan sudah ada sebelumnya
      if (!await checkPhoneNumber(phoneNumber: phoneNumber)) {
        // Jika Belum ada sebelumnya
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // await _auth.signInWithCredential(credential);
            // Get.toNamed(Routes.PHONE_VERIFY);
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId.value = verificationId;
            Get.toNamed(Routes.PHONE_VERIFY, arguments: phoneNumber);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            this.verificationId.value = verificationId;
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              Get.snackbar(
                "Terjadi Kesalahan",
                "Nomor telepon yang Anda masukkan, tidak ditemukan!",
                backgroundColor: AppColors.whiteColor,
                padding: EdgeInsets.all(Dimensions.radius25),
                boxShadows: AppColors.basicShadow,
              );
            }
          },
        );
      } else {
        // Jika Sudah ada sebelumnya
        Get.snackbar(
          "Terjadi Kesalahan",
          _message.toString(),
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.all(Dimensions.radius25),
          boxShadows: AppColors.basicShadow,
        );
      }

      return true;
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan",
        "$e",
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.all(Dimensions.radius25),
        boxShadows: AppColors.basicShadow,
      );
      return false;
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      // Sign In Process (UI)
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      // Mendapatkan detail dari request
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // Kondisi login berhasil
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        // Deklarasi Google Id
        String googleId = userCredential!.additionalUserInfo!.profile!['sub'];

        // Cek apakah user pertama kali login atau untuk kedua kali
        if (userCredential!.additionalUserInfo!.isNewUser) {
          // print("User Baru");
          // Jika User baru Pertama sign in -> REGISTER
          if (await register(
            name: userCredential!.user!.displayName.toString(),
            email: userCredential!.user!.email.toString(),
            password: getRandomString(30),
          )) {
            // Deklarasi
            String idUser = _user!.id.toString();
            // Update profile Image
            await updateProfileImageUrl(
              profileImage: userCredential!.user!.photoURL,
              id: idUser,
            );

            // Update Google Id
            await updateGoogleId(googleId: googleId, id: idUser);

            // Cek apakah nomor telepon sudah ada di akunnya
            if (await checkUserPhoneNumber(id: idUser)) {
              // Jika nomor telepon sudah ada sebelumnya -> pindah ke Activity HOME
              Get.offNamed(Routes.MAIN);
            } else {
              // Jika nomor telepon belum ada sebelumnya -> Register Phone Number
              Get.offNamed(Routes.PHONE_REGISTER);
            }
          } else {
            // Exception Register
            Get.snackbar(
              "Terjadi Kesalahan",
              _message!,
              backgroundColor: AppColors.whiteColor,
              padding: EdgeInsets.all(Dimensions.radius25),
              boxShadows: AppColors.basicShadow,
            );
          }
        } else {
          // print("User Lama");
          // Jika user sudah pernah Daftar -> LOGIN
          if (await updateGoogleId(googleId: googleId, id: null)) {
            String idUser = _user!.id.toString();

            // Simpan Token ke Local Storage
            box.write("token", "${_user!.token}");

            // Update profile Image
            await updateProfileImageUrl(
              profileImage: userCredential!.user!.photoURL,
              id: idUser,
            );
            // Cek apakah nomor telepon sudah ada di akunnya
            if (await checkUserPhoneNumber(id: idUser)) {
              // Jika nomor telepon sudah ada sebelumnya -> pindah ke Activity HOME
              Get.offNamed(Routes.MAIN);
            } else {
              // Jika nomor telepon belum ada sebelumnya -> Register Phone Number
              Get.offNamed(Routes.PHONE_REGISTER);
            }
          } else {
            Get.snackbar(
              "Terjadi Kesalahan",
              "Akun Email sudah terdaftar, silahkan login secara manual!",
              backgroundColor: AppColors.whiteColor,
              padding: EdgeInsets.all(Dimensions.radius25),
              boxShadows: AppColors.basicShadow,
            );
          }
        }

        // print("===== User Credential =====");
        // print(userCredential);
      }
    } catch (e) {
      // Get.snackbar("Terjadi kesalahan", "fasdfasd");
      print(e);
    }
  }

  Future<bool> updatePhoneNumber({
    String? phoneNumber,
    String? id,
  }) async {
    try {
      UserModel user = await AuthService().updatePhoneNumber(
        phoneNumber: phoneNumber,
        id: id,
      );

      _user = user;

      return true;
    } catch (e) {
      _message =
          await AuthService().updatePhoneNumber(phoneNumber: phoneNumber);

      return false;
    }
  }

  Future<bool> updateProfileImageUrl({
    String? profileImage,
    String? id,
  }) async {
    try {
      UserModel user = await AuthService().updateProfileImageUrl(
        profileImage: profileImage,
        id: id,
      );

      _user = user;

      return true;
    } catch (e) {
      _message =
          await AuthService().updateProfileImageUrl(profileImage: profileImage);

      return false;
    }
  }

  Future<bool> checkPhoneNumber({
    String? phoneNumber,
  }) async {
    try {
      if (await AuthService().checkPhoneNumber(phoneNumber: phoneNumber)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _message = await AuthService().checkPhoneNumber(phoneNumber: phoneNumber);
      return false;
    }
  }

  Future<bool> checkUserPhoneNumber({
    String? id,
  }) async {
    try {
      UserModel user = await AuthService().checkUserPhoneNumber(id: id);
      _user = user;
      return true;
    } catch (e) {
      _message = await AuthService().checkUserPhoneNumber(id: id);
      return false;
    }
  }

  Future<bool> checkGoogleId({
    String? googleId,
  }) async {
    try {
      if (await AuthService().checkGoogleId(googleId: googleId)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateGoogleId({
    String? googleId,
    String? id,
  }) async {
    try {
      UserModel user =
          await AuthService().updateGoogleId(googleId: googleId, id: id);

      _user = user;

      return true;
    } catch (e) {
      return false;
    }
  }
}
