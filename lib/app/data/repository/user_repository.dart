import 'dart:convert';
import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/user_provider.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class UserRepository {
  final UserConnect api = UserConnect();

  getUser(int id) async {
    final response = await api.getUser(id);

    //Sucesso
    if (response.isOk) {
      var responseData = User.fromJson(json.decode(response.bodyString!));
      return responseData;
    } else {
      final String erroMsg = getErroMessage(response.body);
      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  Future<void> setUserLocation(Location location) async {
    final Response response = await api.setLocationUser(location);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      print("Localização do usuario atualizada com sucesso");
      await Get.dialog(
          SuccessDialog('Ponto de encontro atualizado com sucesso'));
      Get.back();
    } else {
      print("Falha ao atualizar localização do usuario");
    }
  }
}
