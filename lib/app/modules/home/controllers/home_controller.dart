import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/repository/auth_repository.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'package:simbora_app/app/data/repository/user_repository.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/websocket_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  late TabController tabController;

  final repository = Get.find<RideOfferRepository>();
  final userRepository = Get.find<UserRepository>();
  final auth_repository = Get.find<AuthRepository>();
  final globalcontroller = Get.find<GlobalController>();
  final wscontroller = Get.find<WebSocketController>();

  RxList<RideOffer> listRideOffer = <RideOffer>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    setLocationUser();
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<RideOffer>> getRideOffer(int status) async {
    //return await repository.getAll();
    await repository.getAllRideOffer(status).then((value) {
      listRideOffer.assignAll(value);
    }, onError: (err) {
      Get.dialog(FailureDialog('Falha na requisição'));
    });
    print('loadData');
    return listRideOffer;
  }

  Future<String>? buildAddress(double lng, double lat) async {
    var address = await Nominatim.reverseSearch(
      lat: lat,
      lon: lng,
      addressDetails: true,
      extraTags: true,
      nameDetails: true,
    );
    if (address.address!['highway'] != null) {
      return address.address!['highway'];
    } else {
      return address.address!['road'] + ', ' + address.address!['suburb'];
    }
  }

  Future<void> setLocationUser() async {
    Location location = Location(type: 'Point', coordinates: [
      globalcontroller.userPosition.longitude,
      globalcontroller.userPosition.latitude,
    ]);
    await userRepository.setUserLocation(location);
  }

  Future<void> logoutOnPressed() async {
    await auth_repository.authLogout();
  }
}
