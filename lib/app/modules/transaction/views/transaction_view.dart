import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controllers/basic_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  TransactionView({Key? key}) : super(key: key);
  final controller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Belum ada Transaksi',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
