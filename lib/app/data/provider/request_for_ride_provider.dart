import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class RequestForRideConnect extends GetConnect {
  Future<Response> getAllRequestForRide(User? user) async {
    final response = await get(
        BASE_URL + '/api/requestforride/?receiver=${user!.id}',
        headers: Headers.headers,
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando lista de Requisições de Carona');

    return response;
  }

  Future<Response> createRequestForRide(RequestForRide request) async {
    Get.log('Content: ' + request.toJson().toString());
    final response = await post(
      BASE_URL + '/api/requestforride/',
      request.toJson(),
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }
}
