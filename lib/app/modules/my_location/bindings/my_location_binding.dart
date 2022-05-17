import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/user_repository.dart';

import '../controllers/my_location_controller.dart';

class MyLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLocationController>(() => MyLocationController());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}
