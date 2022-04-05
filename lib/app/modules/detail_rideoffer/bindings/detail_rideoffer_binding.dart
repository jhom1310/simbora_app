import 'package:get/get.dart';

import '../controllers/detail_rideoffer_controller.dart';

class DetailRideofferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRideofferController>(
      () => DetailRideofferController(),
    );
  }
}
