import 'package:get/get.dart';
import 'package:simbora_app/app/data/provider/ride_offer_provider.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';

import '../controllers/my_rideoffer_controller.dart';

class MyRideofferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRideofferController>(() => MyRideofferController());
    Get.lazyPut<RideOfferConnect>(() => RideOfferConnect());
    Get.lazyPut<RideOfferRepository>(() => RideOfferRepository());
  }
}
