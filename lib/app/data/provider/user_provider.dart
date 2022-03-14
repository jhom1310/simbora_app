import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../env.dart';

class UserConnect extends GetConnect {
  ///Busca um usuario por id
  Future<Response> getUser(int id) async {
    final response = await get(BASE_URL + '/api/users/$id',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log(response.body.toString());

    return response;
  }
}
