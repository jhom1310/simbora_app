import 'dart:async';

import 'package:get/get.dart';
import 'package:simbora_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.LOGIN);
    });
  }
}
