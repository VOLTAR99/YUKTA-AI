import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:yukta_ai/palates/color.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar('NOTE', msg, backgroundColor: darkS);
  }

  static void success(String msg) {
    Get.snackbar('SUCCESS', msg, backgroundColor: lightG);
  }

  static void error(String msg) {
    Get.snackbar('ERROR', msg, backgroundColor: darkG, colorText: Colors.white);
  }

  static void showLoadingDialog() {
    Get.dialog(
      Center(
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: mq.width * .9,
          height: mq.height * .9,
        ),
      ),
    );
  }
}
