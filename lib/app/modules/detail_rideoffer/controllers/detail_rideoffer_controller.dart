import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class DetailRideofferController extends GetxController {
  final RideOffer rideoffer = Get.arguments;

  late Rx pointDeparture = LatLng(rideoffer.departurePlace.coordinates[1],
          rideoffer.departurePlace.coordinates[0])
      .obs;
  late Rx<LatLng> pointDestination = LatLng(
          rideoffer.destination.coordinates[1],
          rideoffer.destination.coordinates[0])
      .obs;

  late List<LatLng> routelatlng = List<LatLng>.from(
      jsonDecode(rideoffer.route.replaceAll("'", "\""))['route']
          .map((x) => LatLng(x[1], x[0])));

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
