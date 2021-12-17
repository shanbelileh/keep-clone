import 'dart:developer';

import 'package:get/get.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class HomeController extends GetxController {
  RxBool gridDisplay = true.obs;

  static HomeController get to => Get.find();

  void changeDisplay() async {
    log("change display mode");
    gridDisplay.value=!gridDisplay.value;
  }
}
