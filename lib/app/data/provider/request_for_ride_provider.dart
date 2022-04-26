import 'package:get/get_connect.dart';
import 'package:simbora_app/app/data/model/request_for_ride.dart';
import 'package:simbora_app/app/data/model/ride_offer_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../env.dart';

class RequestForRideConnect extends GetConnect {
  Future<Response> getAllRequestForRide(User? user, RideOffer ride) async {
    final response = await get(
        BASE_URL + '/api/requestforride/?receiver=${user!.id}&ride=${ride.id}',
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

  Future<Response> acceptRequestForRide(RequestForRide request) async {
    Get.log('Content: ' + request.toJson().toString());
    final response = await post(
      BASE_URL + '/api/addorremoverequest/',
      {
        "user_pk": request.sender.id,
        "operation": "add",
        "ride": request.ride.id
      },
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }

  Future<Response> removeRequestForRide(User user, RideOffer ride) async {
    Get.log('Content: ' + user.toJson().toString() + ride.toJson().toString());
    final response = await post(
      BASE_URL + '/api/addorremoverequest/',
      {"user_pk": user.id, "operation": "remove", "ride": ride.id},
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }

  Future<Response> rejectRequestForRide(RequestForRide request) async {
    Get.log('Content: ' + request.toJson().toString());
    final response = await post(
      BASE_URL + '/api/deleterequestforride/',
      {
        "user_pk": request.sender.id,
        "operation": "receiver_deleting",
        "ride": request.ride.id
      },
      headers: Headers.headers,
    );
    Get.log(response.body.toString());
    return response;
  }
}
