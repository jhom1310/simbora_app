import 'dart:convert';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/provider/promotion_provider.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class PromotionRepository {
  final PromotionConnect api = PromotionConnect();
  //final AuthApiClient apo = AuthApiClient();

  ///Faz o login do usuário
  getAll() async {
    final response = await api.getAll();

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<Promotion> responseData =
          list.map((e) => Promotion.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  getAllOrderScore() async {
    final response = await api.getAllOrderScore();

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<Promotion> responseData =
          list.map((e) => Promotion.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> createPromotion(Promotion promotion) async {
    //isLoading = true;
    final Response response = await api.createPromotion(promotion);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      await Get.dialog(SuccessDialog('Promoção criada com sucesso!\n'));
      Get.back();
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */
      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }
}
