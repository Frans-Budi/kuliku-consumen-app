import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kuliku/Widgets/gradient_button.dart';

import '../../../../Widgets/big_text.dart';
import '../../../../Widgets/loading_activity.dart';
import '../../../../Widgets/small_Text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/phone_verify_controller.dart';

class PhoneVerifyView extends GetView<PhoneVerifyController> {
  PhoneVerifyView({Key? key}) : super(key: key);

  final String? phoneNumber = Get.arguments;

  // final controller = Get.put(PhoneVerifyController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundActivity,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              splashRadius: Dimensions.radius25,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.blackColor,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height16),
              child: ListView(
                children: [
                  // Judul
                  BigText(
                    text: "Masukkan Kode OTP",
                    size: Dimensions.font24,
                  ),
                  SizedBox(height: Dimensions.height8),
                  // Keterangan
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: AppColors.textBlack, height: 1.5),
                      children: <TextSpan>[
                        const TextSpan(
                            text:
                                "Masukkan 4 digits kode OTP yang telah kami kirim melalui nomor SMS ke nomor telepon "),
                        TextSpan(
                          text: phoneNumber,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height10 * 2),

                  // Text Input OTP
                  Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Digit 1
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                // FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit1 = val;
                            },
                            showCursor: false,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        // Digit 2
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit2 = val;
                            },
                            showCursor: false,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        // Digit 3
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit3 = val;
                            },
                            showCursor: false,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        // Digit 4
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit4 = val;
                            },
                            showCursor: false,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        // Digit 5
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit5 = val;
                            },
                            showCursor: false,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        // Digit 6
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                // FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            onSaved: (val) {
                              controller.digit6 = val;
                            },
                            showCursor: false,
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Wrap(
            children: [
              // Button Kirim kode
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.height16,
                    right: Dimensions.height16,
                    bottom: Dimensions.height8),
                child: GradientButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      controller.verifyOTP(controller.otp()!);
                    }
                  },
                  height: Dimensions.height10 * 5,
                  child: SmallText(
                    text: "Kirim Kode OTP",
                    color: AppColors.whiteColor,
                    size: Dimensions.font20,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Loading Screen
        Obx(
          () => controller.isLoading.isTrue
              ? const LoadingActivity()
              : const SizedBox(),
        ),
      ],
    );
  }
}
