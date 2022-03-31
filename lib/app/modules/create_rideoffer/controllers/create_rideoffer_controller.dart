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

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDates.assignAll(args.value);
    selectedDates.sort();
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
        destination: DeparturePlace(
          type: "Point",
          coordinates: [
            pointDestination.value.longitude,
            pointDestination.value.latitude
          ],
        ),
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
