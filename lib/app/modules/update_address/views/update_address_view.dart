import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Widgets/big_text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/update_address_controller.dart';

class UpdateAddressView extends GetView<UpdateAddressController> {
  const UpdateAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundActivity,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.height16),
          child: IconButton(
            onPressed: () => Get.back(),
            splashRadius: Dimensions.radius25,
            icon: Icon(
              Icons.close,
              size: Dimensions.iconSize28,
              color: AppColors.blackColor,
            ),
          ),
        ),
        title: BigText(
          text: "Ubah Alamat",
          size: Dimensions.font20,
        ),
      ),
      body: const Center(
        child: Text(
          'Alamat User',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
