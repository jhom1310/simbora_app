import 'dart:convert';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

import 'package:simbora_app/app/data/provider/ride_offer_provider.dart';
import 'package:simbora_app/app/global/controllers/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/modules/detail_rideoffer/controllers/detail_rideoffer_controller.dart';
import 'package:simbora_app/app/routes/app_pages.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class RideOfferRepository {
  final RideOfferConnect api = RideOfferConnect();
  //final AuthApiClient apo = AuthApiClient();

  getAllRideOffer(int status) async {
    final response = await api.getAllRideOffer(status);

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<RideOffer> responseData =
          list.map((e) => RideOffer.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  getMyRideOffer() async {
    final globalController = Get.find<GlobalUserInfoController>();
    User? user = globalController.getSession;

    final response = await api.getMyRideOffer(user!);

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<RideOffer> responseData =
          list.map((e) => RideOffer.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  getMyRideOfferParticipate() async {
    final globalController = Get.find<GlobalUserInfoController>();
    User? user = globalController.getSession;

    final response = await api.getMyRideOfferParticipate(user!);

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<RideOffer> responseData =
          list.map((e) => RideOffer.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  getRideOffer(int id) async {
    final response = await api.getRideOffer(id);

    //Sucesso
    if (response.isOk) {
      var responseData = RideOffer.fromJson(json.decode(response.bodyString!));
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> createRideOffer(RideOffer rideoffer) async {
    //isLoading = true;
    final Response response = await api.createRideOffer(rideoffer);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      await Get.dialog(SuccessDialog('Oferta de Carona criada com sucesso!\n'));
      Get.back();
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */
      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> updateRideOffer(RideOffer rideoffer) async {
    //isLoading = true;
    final Response response = await api.updateRideOffer(rideoffer);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      await Get.dialog(
          SuccessDialog('Oferta de Carona editada com sucesso!\n'));
      final controller = Get.find<DetailRideofferController>();
      await controller.attrideoffer();
      Get.toNamed(Routes.MY_RIDEOFFER);
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */
      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }
}
