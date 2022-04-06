import 'dart:convert';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';

import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/request_for_ride_provider.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class RequestForRideRepository {
  final RequestForRideConnect api = RequestForRideConnect();
  //final AuthApiClient apo = AuthApiClient();

  getAllRequestForRide(User? user) async {
    final response = await api.getAllRequestForRide(user);

    //Sucesso
    if (response.isOk) {
      var list = json.decode(response.bodyString!) as List;
      List<RequestForRide> responseData =
          list.map((e) => RequestForRide.fromJson(e)).toList();
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> createRequestForRide(RequestForRide request) async {
    //isLoading = true;
    /* Map<String, dynamic> resume_request = {
      "sender": request.sender.id,
      "receiver": request.receiver.id,
      "ride": request.ride.id,
      "location": {
        "type": "Point",
        "coordinates": [
          request.location.coordinates[0],
          request.location.coordinates[1]
        ]
      }
    }; */
    final Response response = await api.createRequestForRide(request);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      await Get.dialog(
          SuccessDialog('Solicitação de carona criada com sucesso!\n'));
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
