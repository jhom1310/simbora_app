import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/repository/ride_offer_repository.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';

class HomeController extends GetxController {
  late TabController tabController;

  final repository = Get.find<RideOfferRepository>();

  RxList<RideOffer> listRideOffer = <RideOffer>[].obs;

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
  Future<List<RideOffer>> getRideOffer() async {
    //return await repository.getAll();
    await repository.getAllRideOffer().then((value) {
      listRideOffer.assignAll(value);
    }, onError: (err) {
      Get.dialog(FailureDialog('Falha na requisição'));
    });
    print('loadData');
    return listRideOffer;
  }
}
