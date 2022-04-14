import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/user_repository.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
