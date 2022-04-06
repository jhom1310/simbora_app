import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/request_for_ride_repository.dart';

import '../controllers/detail_rideoffer_controller.dart';

class DetailRideofferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRideofferController>(() => DetailRideofferController());
    Get.lazyPut<RequestForRideRepository>(() => RequestForRideRepository());
  }
}
