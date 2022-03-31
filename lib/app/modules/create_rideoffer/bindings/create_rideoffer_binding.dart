import 'package:get/get.dart';

import '../controllers/create_rideoffer_controller.dart';

class CreateRideofferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRideofferController>(
      () => CreateRideofferController(),
    );
  }
}
