import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/repository/request_for_ride_repository.dart';
import 'package:simbora_app/app/global/controllers/global_controller.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:latlong2/latlong.dart';

class RequestsForRideController extends GetxController {
  //TODO: Implement RequestsForRideController
  final repository = Get.find<RequestForRideRepository>();
  final globalUserController = Get.find<GlobalUserInfoController>();

  RxList<RequestForRide> listRequestForRide = <RequestForRide>[].obs;

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

  Future<List<RequestForRide>> getRequestForRide() async {
    User? user = globalUserController.getSession;
    await repository.getAllRequestForRide(user).then((value) {
      listRequestForRide.assignAll(value);
    }, onError: (err) {
      Get.dialog(FailureDialog('Falha na requisição'));
    });

    return listRequestForRide;
  }
}
