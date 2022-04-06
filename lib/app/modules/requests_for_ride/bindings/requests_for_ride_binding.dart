import 'package:get/get.dart';
import 'package:simbora_app/app/data/repository/request_for_ride_repository.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';

import '../controllers/requests_for_ride_controller.dart';

class RequestsForRideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestsForRideController>(() => RequestsForRideController());
    Get.lazyPut<RequestForRideRepository>(() => RequestForRideRepository());
    Get.lazyPut<GlobalUserInfoController>(() => GlobalUserInfoController());
  }
}
