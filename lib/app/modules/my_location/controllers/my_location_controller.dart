import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/repository/user_repository.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:latlong2/latlong.dart';

class MyLocationController extends GetxController {
  final globalcontroller = Get.find<GlobalController>();
  final globalUserController = Get.find<GlobalUserInfoController>();
  final userRepository = Get.find<UserRepository>();

  late Rx pointDeparture = LatLng(globalcontroller.userPosition.latitude,
          globalcontroller.userPosition.longitude)
      .obs;

  Future<void> setLocationUser() async {
    Location location = Location(type: 'Point', coordinates: [
      pointDeparture.value.longitude,
      pointDeparture.value.latitude
    ]);
    await userRepository.setUserLocation(location);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
