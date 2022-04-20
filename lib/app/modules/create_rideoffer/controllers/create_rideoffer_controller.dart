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
  final globalcontroller = Get.find<GlobalController>();
  final repository = Get.find<RideOfferRepository>();
  final globalUserController = Get.find<GlobalUserInfoController>();

  late Rx pointDeparture = LatLng(globalcontroller.userPosition.latitude,
          globalcontroller.userPosition.longitude)
      .obs;

  late Rx pointDestination = LatLng(0, 0).obs;

  RxList<DateTime> selectedDates = <DateTime>[].obs;

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
    final User? userSession = globalUserController.getSession;
    if (pointDestination.value.longitude == 0) {
      Get.dialog(FailureDialog('Selecione um destino'));
    } else {
      var rideoffer = RideOffer(
        id: 0,
        owner: userSession!,
        passengers: [],
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
    }
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
