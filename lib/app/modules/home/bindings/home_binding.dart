import 'package:get/get.dart';
import 'package:simbora_app/app/data/provider/promotion_provider.dart';
import 'package:simbora_app/app/data/provider/ride_offer_provider.dart';
import 'package:simbora_app/app/data/provider/user_provider.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'package:simbora_app/app/data/repository/user_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RideOfferConnect>(() => RideOfferConnect());
    Get.lazyPut<RideOfferRepository>(() => RideOfferRepository());
    Get.lazyPut<UserConnect>(() => UserConnect());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}
