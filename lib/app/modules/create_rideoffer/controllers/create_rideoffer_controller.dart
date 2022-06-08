import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:latlong2/latlong.dart';

class CreateRideofferController extends GetxController {
  Rx? rideoffer = Get.arguments;
  Rx<bool> loading = Rx<bool>(false);
  final globalcontroller = Get.find<GlobalController>();
  final repository = Get.find<RideOfferRepository>();
  final globalUserController = Get.find<GlobalUserInfoController>();

  late Rx pointDeparture = LatLng(globalcontroller.userPosition.latitude,
          globalcontroller.userPosition.longitude)
      .obs;

  late Rx pointDestination = LatLng(0, 0).obs;

  RxList<DateTime> selectedDates = <DateTime>[].obs;

  List<DateTime>? initialSelectedDates;

  bool isEdit = false;

  Future<void> onSelectionChanged(
      DateRangePickerSelectionChangedArgs args) async {
    List<dynamic> stringsdates =
        args.value.map((d) => d.toString().substring(0, 10)).toList();
    print(stringsdates);

    Iterable<DateTime> diff = selectedDates.where((element) =>
        !stringsdates.contains((element.toString().substring(0, 10))));

    //print(diff);

    if (diff.isNotEmpty) {
      selectedDates.remove(diff.first);
      //print(selectedDates);
    } else {
      final TimeOfDay? newTime = await showTimePicker(
          context: Get.context!, initialTime: TimeOfDay(hour: 9, minute: 00));

      selectedDates.add(DateTime(args.value.last.year, args.value.last.month,
          args.value.last.day, newTime!.hour, newTime.minute));
      selectedDates.sort();
      //print(selectedDates);
    }
  }

  Future<void> addOnPressed() async {
    loading.value = true;
    final User? userSession = globalUserController.getSession;
    if (pointDestination.value.longitude == 0) {
      loading.value = false;
      Get.dialog(FailureDialog('Selecione um destino'));
    }
    if (selectedDates.isEmpty) {
      loading.value = false;
      Get.dialog(FailureDialog('Selecione uma data'));
    } else {
      var rideoffer = RideOffer(
        id: 0,
        owner: userSession!,
        passengers: [],
        passengers_locations: [],
        departurePlace: DeparturePlace(
          type: "Point",
          coordinates: [
            pointDeparture.value.longitude,
            pointDeparture.value.latitude
          ],
        ),
        departure_display: '',
        destination: DeparturePlace(
          type: "Point",
          coordinates: [
            pointDestination.value.longitude,
            pointDestination.value.latitude
          ],
        ),
        destination_display: '',
        dates: selectedDates,
        status: 1,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
        route: '2',
      );
      await repository.createRideOffer(rideoffer);
      loading.value = false;
    }
  }

  Future<void> updatePressed() async {
    final User? userSession = globalUserController.getSession;
    if (pointDestination.value.longitude == 0) {
      Get.dialog(FailureDialog('Selecione um destino'));
    }
    if (selectedDates.isEmpty) {
      Get.dialog(FailureDialog('Selecione uma data'));
    } else {
      rideoffer?.value.departurePlace.coordinates[0] =
          pointDeparture.value.longitude;
      rideoffer?.value.departurePlace.coordinates[1] =
          pointDeparture.value.latitude;

      rideoffer?.value.destination.coordinates[0] =
          pointDestination.value.longitude;
      rideoffer?.value.destination.coordinates[1] =
          pointDestination.value.latitude;

      rideoffer?.value.dates = selectedDates.value;

      await repository.updateRideOffer(rideoffer?.value);
    }
  }

  @override
  void onInit() {
    if (rideoffer != null) {
      isEdit = true;
      //partida
      pointDeparture.value.longitude =
          rideoffer?.value.departurePlace.coordinates[0];
      pointDeparture.value.latitude =
          rideoffer?.value.departurePlace.coordinates[1];

      //destino
      pointDestination.value.longitude =
          rideoffer?.value.destination.coordinates[0];

      pointDestination.value.latitude =
          rideoffer?.value.destination.coordinates[1];

      initialSelectedDates = rideoffer?.value.dates;
      selectedDates.value = rideoffer?.value.dates;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
