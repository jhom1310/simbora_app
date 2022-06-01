import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';

class ParticipateRideofferController extends GetxController {
  final repository = Get.find<RideOfferRepository>();

  RxList<RideOffer> myListRideOffer = <RideOffer>[].obs;

  Future<List<RideOffer>> getMyRideOffer() async {
    //return await repository.getAll();
    await repository.getMyRideOfferParticipate().then((value) {
      myListRideOffer.assignAll(value);
    }, onError: (err) {
      Get.dialog(FailureDialog('Falha na requisição'));
    });
    print('loadData');
    return myListRideOffer;
  }

  final count = 0.obs;
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
  void increment() => count.value++;
}
