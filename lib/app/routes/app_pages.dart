import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/change_profile/bindings/change_profile_binding.dart';
import '../modules/change_profile/views/change_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginScreen/bindings/login_screen_binding.dart';
import '../modules/loginScreen/views/login_screen_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/phone_register/bindings/phone_register_binding.dart';
import '../modules/phone_register/views/phone_register_view.dart';
import '../modules/phone_verify/bindings/phone_verify_binding.dart';
import '../modules/phone_verify/views/phone_verify_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registerScreen/bindings/register_screen_binding.dart';
import '../modules/registerScreen/views/register_screen_view.dart';
import '../modules/searchNeeds/bindings/search_needs_binding.dart';
import '../modules/searchNeeds/views/search_needs_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';
import '../modules/search_result_detail/bindings/search_result_detail_binding.dart';
import '../modules/search_result_detail/views/search_result_detail_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SEARCH_NEEDS,
      page: () => SearchNeedsView(),
      binding: SearchNeedsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => const RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_REGISTER,
      page: () => PhoneRegisterView(),
      binding: PhoneRegisterBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFY,
      page: () => PhoneVerifyView(),
      binding: PhoneVerifyBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => const ChangeProfileView(),
      binding: ChangeProfileBinding(),
      transition: Transition.downToUp,
      curve: Curves.easeOut,
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResultView(),
      binding: SearchResultBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT_DETAIL,
      page: () => SearchResultDetailView(),
      binding: SearchResultDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
