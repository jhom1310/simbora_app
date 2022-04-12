import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/repository/request_for_ride_repository.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'dart:convert';

import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';

class DetailRideofferController extends GetxController {
  Rx rideoffer = Get.arguments;
  final globalUserController = Get.find<GlobalUserInfoController>();
  final repository = Get.find<RequestForRideRepository>();
  final riderepository = Get.find<RideOfferRepository>();

  late Rx pointDeparture = LatLng(rideoffer.value.departurePlace.coordinates[1],
          rideoffer.value.departurePlace.coordinates[0])
      .obs;
  late Rx<LatLng> pointDestination = LatLng(
          rideoffer.value.destination.coordinates[1],
          rideoffer.value.destination.coordinates[0])
      .obs;

  late List<LatLng> routelatlng = List<LatLng>.from(
      jsonDecode(rideoffer.value.route.replaceAll("'", "\""))['route']
          .map((x) => LatLng(x[1], x[0])));

  //Sollicitação de Carona
  final globalcontroller = Get.find<GlobalController>();
  late Rx pointDepartureRequest = LatLng(globalcontroller.userPosition.latitude,
          globalcontroller.userPosition.longitude)
      .obs;

  Future<void> addOnPressed() async {
    final User? userSession = globalUserController.getSession;

    var request = RequestForRide(
      id: 0,
      sender: userSession!,
      receiver: rideoffer.value.owner,
      ride: rideoffer.value,
      isSeen: false,
      location: Location(
        type: "Point",
        coordinates: [
          pointDepartureRequest.value.longitude,
          pointDepartureRequest.value.latitude
        ],
      ),
    );
    await repository.createRequestForRide(request);
  }

  Future<void> attrideoffer() async {
    rideoffer.value = await riderepository.getRideOffer(rideoffer.value.id);
  }

  ////
  @override
  void onInit() {
    attrideoffer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
