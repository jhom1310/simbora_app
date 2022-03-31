import 'package:get/get.dart';
import 'package:simbora_app/app/data/provider/auth_provider.dart';
import 'package:simbora_app/app/data/repository/auth_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthConnect>(() => AuthConnect());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
