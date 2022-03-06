import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/auth_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
