import 'dart:convert';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/message_model.dart';
import 'package:simbora_app/app/data/model/promotion_model.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/provider/chat_provider.dart';
import 'package:simbora_app/app/data/provider/promotion_provider.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class ChatRepository {
  final ChatConnect api = ChatConnect();
  //final AuthApiClient apo = AuthApiClient();

  ///Faz o login do usuário
  getAllfromRide(RideOffer ride) async {
    final response = await api.getAllfromRide(ride);

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<MessageRide> responseData =
          list.map((e) => MessageRide.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> createMessage(MessageRide message) async {
    //isLoading = true;
    final Response response = await api.createMessage(message);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      //await Get.dialog(SuccessDialog('Mensagem enviada com sucesso!\n'));
      //Get.back();
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */
      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }
}
