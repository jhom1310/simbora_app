import 'package:get/get.dart';
import 'package:simbora_app/app/data/provider/ride_offer_provider.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';

import '../controllers/participate_rideoffer_controller.dart';

class ParticipateRideofferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipateRideofferController>(
        () => ParticipateRideofferController());
    Get.lazyPut<RideOfferConnect>(() => RideOfferConnect());
    Get.lazyPut<RideOfferRepository>(() => RideOfferRepository());
  }
}
